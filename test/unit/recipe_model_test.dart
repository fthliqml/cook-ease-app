import 'package:flutter_test/flutter_test.dart';
import 'package:cook_ease_app/core/models/recipes.dart';

void main() {
  group('RecipeModel Tests', () {
    test('should create RecipeModel with all properties', () {
      // Arrange & Act
      final recipe = RecipeModel(
        id: 1,
        title: 'Nasi Goreng',
        description: 'Indonesian fried rice',
        imgUrl: 'assets/images/list1.jpg',
        cookTime: '30 min',
        category: 'Indonesian',
        difficulty: RecipeDifficulty.two,
        isFavorited: false,
      );

      // Assert
      expect(recipe.id, 1);
      expect(recipe.title, 'Nasi Goreng');
      expect(recipe.description, 'Indonesian fried rice');
      expect(recipe.imgUrl, 'assets/images/list1.jpg');
      expect(recipe.cookTime, '30 min');
      expect(recipe.isFavorited, false);
    });

    test('should copy RecipeModel with updated properties', () {
      // Arrange
      final original = RecipeModel(
        id: 1,
        title: 'Nasi Goreng',
        description: 'Indonesian fried rice',
        imgUrl: 'assets/images/list1.jpg',
        cookTime: '30 min',
        category: 'Indonesian',
        difficulty: RecipeDifficulty.two,
        isFavorited: false,
      );

      // Act
      final copied = original.copyWith(isFavorited: true);

      // Assert
      expect(copied.id, original.id);
      expect(copied.title, original.title);
      expect(copied.isFavorited, true);
      expect(original.isFavorited, false); // Original unchanged
    });

    test('should return correct cookTime', () {
      // Arrange
      final recipe1 = RecipeModel(
        id: 1,
        title: 'Test',
        description: 'Test',
        imgUrl: '',
        cookTime: '45 min',
        category: 'Test',
        difficulty: RecipeDifficulty.one,
        isFavorited: false,
      );

      final recipe2 = RecipeModel(
        id: 2,
        title: 'Test',
        description: 'Test',
        imgUrl: '',
        cookTime: '',
        category: 'Test',
        difficulty: RecipeDifficulty.one,
        isFavorited: false,
      );

      // Assert
      expect(recipe1.cookTime, '45 min');
      expect(recipe2.cookTime, '');
    });

    test('should handle empty strings correctly', () {
      // Arrange & Act
      final recipe = RecipeModel(
        id: 1,
        title: '',
        description: '',
        imgUrl: '',
        cookTime: '',
        category: '',
        difficulty: RecipeDifficulty.one,
        isFavorited: false,
      );

      // Assert
      expect(recipe.title, '');
      expect(recipe.description, '');
      expect(recipe.imgUrl, '');
      expect(recipe.cookTime, '');
    });
  });
}
