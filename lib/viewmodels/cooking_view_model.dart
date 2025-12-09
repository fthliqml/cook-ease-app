import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:cook_ease_app/data/local/drift/app_database.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';
import 'package:cook_ease_app/core/models/cooking_history.dart';
import 'package:cook_ease_app/core/models/recipe_step.dart';
import 'package:cook_ease_app/core/models/cooking_step_log.dart';
import 'package:cook_ease_app/core/models/recipes.dart';

/// ViewModel for managing active cooking session
class CookingViewModel extends ChangeNotifier {
  final AppDatabase _db;
  final RecipeRepository _repo;
  final int recipeId;

  CookingViewModel(this._db, this._repo, this.recipeId);

  // Loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Recipe data
  RecipeModel? _recipe;
  RecipeModel? get recipe => _recipe;

  List<RecipeStepModel> _steps = [];
  List<RecipeStepModel> get steps => _steps;

  // Cooking session
  CookingHistoryModel? _currentSession;
  CookingHistoryModel? get currentSession => _currentSession;

  int _currentStepIndex = 0;
  int get currentStepIndex => _currentStepIndex;

  RecipeStepModel? get currentStep =>
      _steps.isNotEmpty && _currentStepIndex < _steps.length
      ? _steps[_currentStepIndex]
      : null;

  bool get isFirstStep => _currentStepIndex == 0;
  bool get isLastStep => _currentStepIndex >= _steps.length - 1;

  // Completion state
  bool _isCookingCompleted = false;
  bool get isCookingCompleted => _isCookingCompleted; // Timer state
  Timer? _timer;
  int _remainingSeconds = 0;
  int get remainingSeconds => _remainingSeconds;
  bool _isTimerRunning = false;
  bool get isTimerRunning => _isTimerRunning;
  bool _isTimerCompleted = false;
  bool get isTimerCompleted => _isTimerCompleted;

  String get formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Initialize: load recipe, steps, and start/resume cooking session
  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Load recipe
      _recipe = await _repo.getRecipeModelById(recipeId);

      // Load recipe steps
      final stepData = await _db.recipeStepDao.getStepsByRecipeId(recipeId);
      _steps = stepData
          .map(
            (data) => RecipeStepModel(
              id: data.id,
              recipeId: data.recipeId,
              stepOrder: data.stepOrder,
              stepTitle: data.stepTitle,
              stepDescription: data.stepDescription,
              durationMinutes: data.durationMinutes,
              timerLabel: data.timerLabel,
              createdAt: data.createdAt,
            ),
          )
          .toList();

      // Check if there's an in-progress session for this recipe
      final inProgressSessions = await _db.cookingHistoryDao
          .getHistoryByRecipeId(recipeId);
      final existingSession = inProgressSessions.firstWhere(
        (session) => session.status == CookingStatus.inProgress,
        orElse: () => CookingHistoryModel(
          id: 0,
          recipeId: recipeId,
          startedAt: DateTime.now(),
          status: CookingStatus.inProgress,
          currentStep: 0,
        ),
      );

      if (existingSession.id > 0) {
        // Resume existing session
        _currentSession = existingSession;
        _currentStepIndex = existingSession.currentStep;
      } else {
        // Start new session
        await _startNewSession();
      }
    } catch (e) {
      debugPrint('Error initializing cooking session: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Start a new cooking session
  Future<void> _startNewSession() async {
    final historyId = await _db.cookingHistoryDao.insertHistory(
      CookingHistoryModel(
        id: 0,
        recipeId: recipeId,
        startedAt: DateTime.now(),
        status: CookingStatus.inProgress,
        currentStep: 0,
      ),
    );

    _currentSession = await _db.cookingHistoryDao.getHistoryById(historyId);
    _currentStepIndex = 0;
    notifyListeners();
  }

  /// Start timer for current step (if it has duration)
  void startTimer() {
    final step = currentStep;
    if (step?.durationMinutes == null) return;

    _remainingSeconds = (step!.durationMinutes! * 60);
    _isTimerRunning = true;
    _isTimerCompleted = false;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        _isTimerRunning = false;
        _isTimerCompleted = true;
        timer.cancel();
        notifyListeners();
      }
    });

    notifyListeners();
  }

  /// Stop/pause timer
  void stopTimer() {
    _timer?.cancel();
    _isTimerRunning = false;
    notifyListeners();
  }

  /// Reset timer
  void resetTimer() {
    _timer?.cancel();
    _isTimerRunning = false;
    _isTimerCompleted = false;
    final step = currentStep;
    if (step?.durationMinutes != null) {
      _remainingSeconds = (step!.durationMinutes! * 60);
    }
    notifyListeners();
  }

  /// Complete current step and move to next
  Future<void> completeStep() async {
    if (_currentSession == null || currentStep == null) return;

    stopTimer();

    try {
      // Check if step already logged
      final existingLog = await _db.cookingStepLogDao.getLogByHistoryAndStep(
        _currentSession!.id,
        currentStep!.id,
      );

      if (existingLog != null) {
        // Update existing log
        final updatedLog = CookingStepLogModel(
          id: existingLog.id,
          cookingHistoryId: existingLog.cookingHistoryId,
          recipeStepId: existingLog.recipeStepId,
          startedAt: existingLog.startedAt,
          completedAt: DateTime.now(),
          skipped: false,
        );
        await _db.cookingStepLogDao.updateLog(updatedLog);
      } else {
        // Insert new log
        final log = CookingStepLogModel(
          id: 0,
          cookingHistoryId: _currentSession!.id,
          recipeStepId: currentStep!.id,
          startedAt: DateTime.now(),
          completedAt: DateTime.now(),
          skipped: false,
        );
        await _db.cookingStepLogDao.insertLog(log);
      }
    } catch (e) {
      debugPrint('Error logging step completion: $e');
      // Continue anyway - don't block navigation
    }

    if (isLastStep) {
      // This was the last step - complete cooking
      await completeCooking();
    } else {
      // Move to next step
      await nextStep();
    }
  }

  /// Skip current step
  Future<void> skipStep() async {
    if (_currentSession == null || currentStep == null) return;

    stopTimer();

    try {
      // Check if step already logged
      final existingLog = await _db.cookingStepLogDao.getLogByHistoryAndStep(
        _currentSession!.id,
        currentStep!.id,
      );

      if (existingLog != null) {
        // Update existing log as skipped
        final updatedLog = CookingStepLogModel(
          id: existingLog.id,
          cookingHistoryId: existingLog.cookingHistoryId,
          recipeStepId: existingLog.recipeStepId,
          startedAt: existingLog.startedAt,
          completedAt: DateTime.now(),
          skipped: true,
        );
        await _db.cookingStepLogDao.updateLog(updatedLog);
      } else {
        // Insert new log as skipped
        final log = CookingStepLogModel(
          id: 0,
          cookingHistoryId: _currentSession!.id,
          recipeStepId: currentStep!.id,
          startedAt: DateTime.now(),
          completedAt: DateTime.now(),
          skipped: true,
        );
        await _db.cookingStepLogDao.insertLog(log);
      }
    } catch (e) {
      debugPrint('Error logging step skip: $e');
      // Continue anyway - don't block navigation
    }

    if (isLastStep) {
      // This was the last step - complete cooking
      await completeCooking();
    } else {
      // Move to next step
      await nextStep();
    }
  }

  /// Move to next step
  Future<void> nextStep() async {
    if (isLastStep || _currentSession == null) return;

    _currentStepIndex++;
    resetTimer();

    // Update session
    _currentSession = _currentSession!.copyWith(currentStep: _currentStepIndex);
    await _db.cookingHistoryDao.updateHistory(_currentSession!);

    notifyListeners();
  }

  /// Move to previous step
  Future<void> previousStep() async {
    if (isFirstStep) return;

    _currentStepIndex--;
    resetTimer();

    // Update session
    _currentSession = _currentSession!.copyWith(currentStep: _currentStepIndex);
    await _db.cookingHistoryDao.updateHistory(_currentSession!);

    notifyListeners();
  }

  /// Complete cooking session
  Future<void> completeCooking() async {
    if (_currentSession == null) return;

    stopTimer();

    await _db.cookingHistoryDao.completeHistory(_currentSession!.id);
    _currentSession = _currentSession!.copyWith(
      status: CookingStatus.completed,
      completedAt: DateTime.now(),
    );

    _isCookingCompleted = true;
    notifyListeners();
  }

  /// Abandon cooking session
  Future<void> abandonCooking(String? reason) async {
    if (_currentSession == null) return;

    stopTimer();

    // Update session with notes first, then mark as abandoned
    if (reason != null) {
      _currentSession = _currentSession!.copyWith(notes: reason);
      await _db.cookingHistoryDao.updateHistory(_currentSession!);
    }

    await _db.cookingHistoryDao.abandonHistory(_currentSession!.id);
    _currentSession = _currentSession!.copyWith(
      status: CookingStatus.abandoned,
    );

    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
