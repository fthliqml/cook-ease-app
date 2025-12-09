import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';
import 'package:cook_ease_app/config/themes/app_text_styles.dart';
import 'package:cook_ease_app/viewmodels/cooking_view_model.dart';
import 'package:cook_ease_app/data/local/drift/db_provider.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';

class CookPage extends StatefulWidget {
  final String recipeId;
  const CookPage({super.key, required this.recipeId});

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  late final CookingViewModel vm;
  bool _isAbandonDialogShown = false;

  @override
  void initState() {
    super.initState();
    final id = int.tryParse(widget.recipeId);
    if (id == null) return;

    final db = DBProvider().database;
    final repo = RecipeRepository(db);
    vm = CookingViewModel(db, repo, id);
    vm.addListener(_onVmChanged);
    vm.init();
  }

  void _onVmChanged() {
    setState(() {});

    // Check if cooking completed
    if (vm.isCookingCompleted && mounted) {
      // Show success dialog then navigate back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showCompletionDialog();
      });
    }
  }

  @override
  void dispose() {
    vm.removeListener(_onVmChanged);
    vm.dispose();
    super.dispose();
  }

  Future<void> _showCompletionDialog() async {
    final recipeName = vm.recipe?.title ?? 'Recipe';

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.celebration_rounded,
                color: AppColors.primary,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(child: Text('Cooking Complete!', style: AppTextStyles.h3)),
          ],
        ),
        content: Text(
          'Congratulations! You\'ve successfully completed cooking $recipeName. Enjoy your meal!',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop(); // Close dialog
                  context.pop(); // Navigate back to previous page
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.buttonText.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAbandonDialog() async {
    if (_isAbandonDialogShown) return;
    _isAbandonDialogShown = true;

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.exit_to_app_rounded, color: AppColors.primary, size: 28),
            const SizedBox(width: 12),
            Expanded(child: Text('Exit Cooking?', style: AppTextStyles.h3)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'What would you like to do?',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),

            // Continue button
            InkWell(
              onTap: () => Navigator.of(context).pop('continue'),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Continue Cooking',
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            'Go back and continue',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Save & Exit button
            InkWell(
              onTap: () => Navigator.of(context).pop('save'),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondary, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.save_rounded,
                      color: AppColors.secondary,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Save & Exit',
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondary,
                            ),
                          ),
                          Text(
                            'Resume later from this step',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Abandon button
            InkWell(
              onTap: () => Navigator.of(context).pop('abandon'),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.error, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(Icons.close_rounded, color: AppColors.error, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Abandon',
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.error,
                            ),
                          ),
                          Text(
                            'Mark as abandoned',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: const [],
      ),
    );

    _isAbandonDialogShown = false;

    if (!mounted) return;

    if (result == 'save') {
      // Just exit, session stays in-progress for resume later
      context.pop();
    } else if (result == 'abandon') {
      // Mark as abandoned then exit
      await vm.abandonCooking('User abandoned cooking session');
      if (mounted) context.pop();
    }
    // If 'continue' or null (dismissed), stay on page
  }

  @override
  Widget build(BuildContext context) {
    if (vm.isLoading) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final recipe = vm.recipe;
    final currentStep = vm.currentStep;

    if (recipe == null || currentStep == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.surface,
          title: Text('Cooking', style: AppTextStyles.h4),
        ),
        body: Center(
          child: Text(
            'Recipe not found',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(recipe.title),
      body: Column(
        children: [
          _buildProgressSection(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildStepContent(currentStep)],
              ),
            ),
          ),
          _buildBottomControls(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(String recipeTitle) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            Icons.close_rounded,
            color: AppColors.textPrimary,
            size: 22,
          ),
          onPressed: _showAbandonDialog,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cooking', style: AppTextStyles.h4.copyWith(fontSize: 16)),
          Text(
            recipeTitle,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    final totalSteps = vm.steps.length;
    final currentIndex = vm.currentStepIndex;
    final progress = totalSteps > 0 ? (currentIndex + 1) / totalSteps : 0.0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: AppColors.softShadow,
      ),
      child: Column(
        children: [
          // Progress bar
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: AppColors.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${currentIndex + 1}/$totalSteps',
                  style: AppTextStyles.buttonText.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),

          // Timer (if step has duration)
          if (vm.currentStep?.durationMinutes != null) ...[
            const SizedBox(height: 16),
            _buildTimer(),
          ],
        ],
      ),
    ).animate().slideY(begin: -0.3, end: 0, duration: 400.ms);
  }

  Widget _buildTimer() {
    final hasTimer = vm.currentStep?.durationMinutes != null;
    if (!hasTimer) return const SizedBox.shrink();

    final isRunning = vm.isTimerRunning;
    final isCompleted = vm.isTimerCompleted;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCompleted
            ? AppColors.primary.withValues(alpha: 0.1)
            : AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCompleted ? AppColors.primary : AppColors.surfaceVariant,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCompleted
                  ? AppColors.primary
                  : (isRunning ? AppColors.secondary : AppColors.textTertiary),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCompleted ? Icons.check_rounded : Icons.timer_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vm.currentStep?.timerLabel ?? 'Timer',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  vm.formattedTime,
                  style: AppTextStyles.h2.copyWith(
                    fontSize: 24,
                    color: isCompleted
                        ? AppColors.primary
                        : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (!isCompleted) ...[
            IconButton(
              onPressed: isRunning ? vm.stopTimer : vm.startTimer,
              icon: Icon(
                isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                color: AppColors.primary,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: vm.resetTimer,
              icon: Icon(
                Icons.refresh_rounded,
                color: AppColors.textSecondary,
                size: 24,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStepContent(dynamic step) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppColors.cardShadowStyle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step number badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Step ${vm.currentStepIndex + 1}',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Step title
          Text(step.stepTitle, style: AppTextStyles.h2.copyWith(fontSize: 24)),
          const SizedBox(height: 12),

          // Step description
          Text(
            step.stepDescription,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),

          // Duration info
          if (step.durationMinutes != null) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.access_time_rounded,
                  size: 18,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  '${step.durationMinutes} minutes',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 400.ms, delay: 200.ms);
  }

  Widget _buildBottomControls() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: AppColors.elevatedShadow,
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Previous button
            if (!vm.isFirstStep)
              Expanded(
                child: OutlinedButton(
                  onPressed: vm.previousStep,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Previous',
                    style: AppTextStyles.buttonText.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

            if (!vm.isFirstStep) const SizedBox(width: 12),

            // Skip button
            Expanded(
              child: OutlinedButton(
                onPressed: vm.skipStep,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: AppColors.textTertiary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Skip',
                  style: AppTextStyles.buttonText.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Next/Complete button
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: vm.completeStep,
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            vm.isLastStep
                                ? Icons.check_circle_rounded
                                : Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            vm.isLastStep ? 'Finish' : 'Next Step',
                            style: AppTextStyles.buttonText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().slideY(begin: 0.3, end: 0, duration: 400.ms);
  }
}
