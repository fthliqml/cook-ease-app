import 'package:flutter_test/flutter_test.dart';
import 'package:cook_ease_app/core/models/recipe_step.dart';

void main() {
  group('RecipeStepModel Tests', () {
    test('should create RecipeStepModel with all properties', () {
      // Arrange & Act
      final step = RecipeStepModel(
        id: 1,
        recipeId: 1,
        stepOrder: 1,
        stepTitle: 'Persiapan',
        stepDescription: 'Siapkan semua bahan',
        durationMinutes: 5,
        timerLabel: 'Prep time',
        createdAt: DateTime(2024, 1, 1),
      );

      // Assert
      expect(step.id, 1);
      expect(step.recipeId, 1);
      expect(step.stepOrder, 1);
      expect(step.stepTitle, 'Persiapan');
      expect(step.stepDescription, 'Siapkan semua bahan');
      expect(step.durationMinutes, 5);
      expect(step.timerLabel, 'Prep time');
    });

    test('should handle null durationMinutes', () {
      // Arrange
      final step1 = RecipeStepModel(
        id: 1,
        recipeId: 1,
        stepOrder: 1,
        stepTitle: 'Test',
        stepDescription: 'Test',
        durationMinutes: 10,
        timerLabel: null,
        createdAt: DateTime.now(),
      );

      final step2 = RecipeStepModel(
        id: 2,
        recipeId: 1,
        stepOrder: 2,
        stepTitle: 'Test',
        stepDescription: 'Test',
        durationMinutes: null,
        timerLabel: null,
        createdAt: DateTime.now(),
      );

      // Assert
      expect(step1.durationMinutes, 10);
      expect(step2.durationMinutes, null);
    });

    test('should handle timerLabel correctly', () {
      // Arrange
      final step1 = RecipeStepModel(
        id: 1,
        recipeId: 1,
        stepOrder: 1,
        stepTitle: 'Test',
        stepDescription: 'Test',
        durationMinutes: 10,
        timerLabel: 'Cook time',
        createdAt: DateTime.now(),
      );

      final step2 = RecipeStepModel(
        id: 2,
        recipeId: 1,
        stepOrder: 2,
        stepTitle: 'Test',
        stepDescription: 'Test',
        durationMinutes: 5,
        timerLabel: null,
        createdAt: DateTime.now(),
      );

      // Assert
      expect(step1.timerLabel, 'Cook time');
      expect(step2.timerLabel, null);
    });

    test('should handle empty stepTitle', () {
      // Arrange
      final step = RecipeStepModel(
        id: 1,
        recipeId: 1,
        stepOrder: 1,
        stepTitle: '',
        stepDescription: 'Description only',
        durationMinutes: null,
        timerLabel: null,
        createdAt: DateTime.now(),
      );

      // Assert
      expect(step.stepTitle, '');
      expect(step.stepDescription, 'Description only');
    });

    test('should maintain stepOrder for sorting', () {
      // Arrange
      final steps = [
        RecipeStepModel(
          id: 3,
          recipeId: 1,
          stepOrder: 3,
          stepTitle: 'Step 3',
          stepDescription: 'Third step',
          durationMinutes: null,
          timerLabel: null,
          createdAt: DateTime.now(),
        ),
        RecipeStepModel(
          id: 1,
          recipeId: 1,
          stepOrder: 1,
          stepTitle: 'Step 1',
          stepDescription: 'First step',
          durationMinutes: null,
          timerLabel: null,
          createdAt: DateTime.now(),
        ),
        RecipeStepModel(
          id: 2,
          recipeId: 1,
          stepOrder: 2,
          stepTitle: 'Step 2',
          stepDescription: 'Second step',
          durationMinutes: null,
          timerLabel: null,
          createdAt: DateTime.now(),
        ),
      ];

      // Act
      steps.sort((a, b) => a.stepOrder.compareTo(b.stepOrder));

      // Assert
      expect(steps[0].stepTitle, 'Step 1');
      expect(steps[1].stepTitle, 'Step 2');
      expect(steps[2].stepTitle, 'Step 3');
    });

    test('should handle null durationMinutes and timerLabel together', () {
      // Arrange
      final step = RecipeStepModel(
        id: 1,
        recipeId: 1,
        stepOrder: 1,
        stepTitle: 'Test',
        stepDescription: 'Test description',
        durationMinutes: null,
        timerLabel: null,
        createdAt: DateTime.now(),
      );

      // Assert
      expect(step.durationMinutes, null);
      expect(step.timerLabel, null);
    });
  });
}
