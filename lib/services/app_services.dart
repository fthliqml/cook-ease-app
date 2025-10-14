import 'package:cook_ease_app/core/models/recipes_data.dart';
import 'package:cook_ease_app/data/local/drift/app_database.dart';
import 'package:cook_ease_app/data/local/drift/tables/recipes.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';

class AppServices {
  AppServices._();

  // Singletons
  static final AppDatabase db = AppDatabase();
  static final RecipeRepository recipeRepository = RecipeRepository(db);

  // Seed DB from the legacy in-memory data on first run
  static Future<void> seedIfEmpty() async {
    final existing = await recipeRepository.getAllRecipes();
    if (existing.isNotEmpty) return;

    // Map legacy static data to DB schema
    for (final m in RecipesData.recipes) {
      final title = (m['title'] ?? '').toString();
      final description = (m['description'] ?? '').toString();
      final imgUrl = (m['photo'] ?? '').toString();
      final cookTime = (m['cookTime'] ?? '').toString();
      await recipeRepository.insertRecipe(
        RecipesCompanion.insert(
          title: title,
          description: description.isEmpty
              ? 'No description provided.'
              : description,
          imgUrl: imgUrl.isEmpty ? 'assets/images/placeholder.jpg' : imgUrl,
          cookTime: cookTime.isEmpty ? '0 min' : cookTime,
          category: 'General',
          difficultyLevel: Difficulty.three,
          isFavorited: false,
        ),
      );
    }
  }
}
