import 'package:flutter_test/flutter_test.dart';
import 'package:cook_ease_app/core/models/recipe_ingredient.dart';

void main() {
  group('RecipeIngredientModel Tests', () {
    test('should create RecipeIngredientModel with all properties', () {
      // Arrange & Act
      final ingredient = RecipeIngredientModel(
        id: 1,
        recipeId: 1,
        name: 'Beras',
        amount: '2',
        unit: 'cup',
        order: 1,
        isOptional: false,
        createdAt: DateTime(2024, 1, 1),
      );

      // Assert
      expect(ingredient.id, 1);
      expect(ingredient.recipeId, 1);
      expect(ingredient.name, 'Beras');
      expect(ingredient.amount, '2');
      expect(ingredient.unit, 'cup');
      expect(ingredient.order, 1);
      expect(ingredient.isOptional, false);
    });

    test('should return correct displayText format', () {
      // Arrange
      final ingredient1 = RecipeIngredientModel(
        id: 1,
        recipeId: 1,
        name: 'Bawang Merah',
        amount: '3',
        unit: 'siung',
        order: 1,
        isOptional: false,
        createdAt: DateTime.now(),
      );

      final ingredient2 = RecipeIngredientModel(
        id: 2,
        recipeId: 1,
        name: 'Garam',
        amount: '1',
        unit: 'sdt',
        order: 2,
        isOptional: true,
        createdAt: DateTime.now(),
      );

      // Assert
      expect(ingredient1.displayText, '3 siung Bawang Merah');
      expect(ingredient2.displayText, '1 sdt Garam');
    });

    test('should handle optional ingredients correctly', () {
      // Arrange
      final optional = RecipeIngredientModel(
        id: 1,
        recipeId: 1,
        name: 'Kemangi',
        amount: '1',
        unit: 'ikat',
        order: 1,
        isOptional: true,
        createdAt: DateTime.now(),
      );

      final required = RecipeIngredientModel(
        id: 2,
        recipeId: 1,
        name: 'Nasi',
        amount: '2',
        unit: 'porsi',
        order: 2,
        isOptional: false,
        createdAt: DateTime.now(),
      );

      // Assert
      expect(optional.isOptional, true);
      expect(optional.displayText, '1 ikat Kemangi');
      expect(required.isOptional, false);
      expect(required.displayText, '2 porsi Nasi');
    });

    test('should handle empty amount and unit', () {
      // Arrange
      final ingredient = RecipeIngredientModel(
        id: 1,
        recipeId: 1,
        name: 'Garam',
        amount: '',
        unit: '',
        order: 1,
        isOptional: false,
        createdAt: DateTime.now(),
      );

      // Assert
      expect(ingredient.displayText, '  Garam');
    });

    test('should maintain order property for sorting', () {
      // Arrange
      final ingredients = [
        RecipeIngredientModel(
          id: 3,
          recipeId: 1,
          name: 'C',
          amount: '1',
          unit: 'unit',
          order: 3,
          isOptional: false,
          createdAt: DateTime.now(),
        ),
        RecipeIngredientModel(
          id: 1,
          recipeId: 1,
          name: 'A',
          amount: '1',
          unit: 'unit',
          order: 1,
          isOptional: false,
          createdAt: DateTime.now(),
        ),
        RecipeIngredientModel(
          id: 2,
          recipeId: 1,
          name: 'B',
          amount: '1',
          unit: 'unit',
          order: 2,
          isOptional: false,
          createdAt: DateTime.now(),
        ),
      ];

      // Act
      ingredients.sort((a, b) => a.order.compareTo(b.order));

      // Assert
      expect(ingredients[0].name, 'A');
      expect(ingredients[1].name, 'B');
      expect(ingredients[2].name, 'C');
    });
  });
}
