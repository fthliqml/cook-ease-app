import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cook_ease_app/views/widgets/components/modern_recipe_card.dart';
import 'package:cook_ease_app/core/models/recipes.dart';

void main() {
  group('ModernRecipeCard Widget Tests', () {
    late RecipeModel testRecipe;

    setUp(() {
      testRecipe = RecipeModel(
        id: 1,
        title: 'Nasi Goreng',
        description: 'Indonesian fried rice',
        imgUrl: 'assets/images/list1.jpg',
        cookTime: '30 min',
        category: 'Indonesian',
        difficulty: RecipeDifficulty.two,
        isFavorited: false,
      );
    });

    testWidgets('should display recipe card with all information', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ModernRecipeCard(recipe: testRecipe)),
        ),
      );
      await tester.pumpAndSettle(); // Wait for animations

      // Assert
      expect(find.text('Nasi Goreng'), findsOneWidget);
      expect(find.text('30 min'), findsOneWidget);
    });

    testWidgets('should render without errors', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ModernRecipeCard(recipe: testRecipe)),
        ),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ModernRecipeCard), findsOneWidget);
    });

    testWidgets('should display category chip', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ModernRecipeCard(recipe: testRecipe)),
        ),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Indonesian'), findsOneWidget);
      expect(find.byIcon(Icons.access_time_rounded), findsOneWidget);
    });

    testWidgets('should display difficulty indicator', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ModernRecipeCard(recipe: testRecipe)),
        ),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.local_fire_department_rounded), findsOneWidget);
    });

    testWidgets('should handle empty cook time gracefully', (
      WidgetTester tester,
    ) async {
      // Arrange
      final recipeWithoutTime = testRecipe.copyWith(cookTime: '');

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ModernRecipeCard(recipe: recipeWithoutTime)),
        ),
      );
      await tester.pumpAndSettle();

      // Assert - Should still render without error
      expect(find.byType(ModernRecipeCard), findsOneWidget);
      expect(find.text('Nasi Goreng'), findsOneWidget);
    });
  });
}
