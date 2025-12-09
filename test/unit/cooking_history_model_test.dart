import 'package:flutter_test/flutter_test.dart';
import 'package:cook_ease_app/core/models/cooking_history.dart';

void main() {
  group('CookingHistoryModel Tests', () {
    test('should create CookingHistoryModel with all properties', () {
      // Arrange & Act
      final history = CookingHistoryModel(
        id: 1,
        recipeId: 1,
        status: CookingStatus.inProgress,
        startedAt: DateTime(2024, 1, 1, 10, 0),
        completedAt: null,
        currentStep: 2,
      );

      // Assert
      expect(history.id, 1);
      expect(history.recipeId, 1);
      expect(history.status, CookingStatus.inProgress);
      expect(history.startedAt, DateTime(2024, 1, 1, 10, 0));
      expect(history.completedAt, null);
      expect(history.currentStep, 2);
    });

    test('should handle CookingStatus enum correctly', () {
      // Arrange
      final completed = CookingHistoryModel(
        id: 1,
        recipeId: 1,
        status: CookingStatus.completed,
        startedAt: DateTime.now(),
        completedAt: DateTime.now(),
        currentStep: 0,
      );

      final inProgress = CookingHistoryModel(
        id: 2,
        recipeId: 1,
        status: CookingStatus.inProgress,
        startedAt: DateTime.now(),
        completedAt: null,
        currentStep: 1,
      );

      final abandoned = CookingHistoryModel(
        id: 3,
        recipeId: 1,
        status: CookingStatus.abandoned,
        startedAt: DateTime.now(),
        completedAt: null,
        currentStep: 2,
      );

      // Assert
      expect(completed.status, CookingStatus.completed);
      expect(inProgress.status, CookingStatus.inProgress);
      expect(abandoned.status, CookingStatus.abandoned);
    });

    test('should handle completedAt for completed status', () {
      // Arrange
      final startTime = DateTime(2024, 1, 1, 10, 0);
      final endTime = DateTime(2024, 1, 1, 11, 30);

      final history = CookingHistoryModel(
        id: 1,
        recipeId: 1,
        status: CookingStatus.completed,
        startedAt: startTime,
        completedAt: endTime,
        currentStep: 0,
      );

      // Assert
      expect(history.completedAt, endTime);
      expect(history.status, CookingStatus.completed);
    });

    test('should handle currentStep for in-progress status', () {
      // Arrange
      final history = CookingHistoryModel(
        id: 1,
        recipeId: 1,
        status: CookingStatus.inProgress,
        startedAt: DateTime.now(),
        completedAt: null,
        currentStep: 3,
      );

      // Assert
      expect(history.currentStep, 3);
      expect(history.status, CookingStatus.inProgress);
      expect(history.completedAt, null);
    });
  });
}
