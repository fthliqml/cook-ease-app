import 'package:flutter/foundation.dart';
import 'package:cook_ease_app/data/local/drift/app_database.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';
import 'package:cook_ease_app/core/models/cooking_history.dart';
import 'package:cook_ease_app/core/models/recipes.dart';

/// ViewModel for managing cooking history
class HistoryViewModel extends ChangeNotifier {
  final AppDatabase _db;
  final RecipeRepository _repo;

  HistoryViewModel(this._db, this._repo);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<CookingHistoryWithRecipe> _historyList = [];
  List<CookingHistoryWithRecipe> get historyList => _historyList;

  CookingStatus? _filterStatus;
  CookingStatus? get filterStatus => _filterStatus;

  /// Initialize and load all history
  Future<void> init() async {
    await loadHistory();
  }

  /// Load all cooking history
  Future<void> loadHistory() async {
    _isLoading = true;
    notifyListeners();

    try {
      final histories = await _db.cookingHistoryDao.getAllHistory();
      final List<CookingHistoryWithRecipe> combinedList = [];

      for (final history in histories) {
        final recipe = await _repo.getRecipeModelById(history.recipeId);
        if (recipe != null) {
          combinedList.add(
            CookingHistoryWithRecipe(history: history, recipe: recipe),
          );
        }
      }

      _historyList = combinedList;
    } catch (e) {
      debugPrint('Error loading history: $e');
      _historyList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Filter history by status
  void filterByStatus(CookingStatus? status) {
    _filterStatus = status;
    notifyListeners();
  }

  /// Get filtered history
  List<CookingHistoryWithRecipe> get filteredHistory {
    if (_filterStatus == null) {
      return _historyList;
    }
    return _historyList
        .where((item) => item.history.status == _filterStatus)
        .toList();
  }

  /// Delete a history entry
  Future<void> deleteHistory(int historyId) async {
    try {
      await _db.cookingHistoryDao.deleteHistory(historyId);
      await loadHistory();
    } catch (e) {
      debugPrint('Error deleting history: $e');
    }
  }

  /// Get statistics
  int get totalSessions => _historyList.length;

  int get completedCount => _historyList
      .where((item) => item.history.status == CookingStatus.completed)
      .length;

  int get inProgressCount => _historyList
      .where((item) => item.history.status == CookingStatus.inProgress)
      .length;

  int get abandonedCount => _historyList
      .where((item) => item.history.status == CookingStatus.abandoned)
      .length;
}

/// Combined model for history with recipe details
class CookingHistoryWithRecipe {
  final CookingHistoryModel history;
  final RecipeModel recipe;

  CookingHistoryWithRecipe({required this.history, required this.recipe});
}
