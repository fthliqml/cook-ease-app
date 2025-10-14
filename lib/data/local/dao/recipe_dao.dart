import 'package:cook_ease_app/data/local/drift/app_database.dart';
import 'package:cook_ease_app/data/local/drift/tables/recipes.dart';
import 'package:drift/drift.dart';

part 'recipe_dao.g.dart';

@DriftAccessor(tables: [Recipes])
class RecipeDao extends DatabaseAccessor<AppDatabase> with _$RecipeDaoMixin {
  RecipeDao(AppDatabase db) : super(db);

  Future<List<Recipe>> getAllRecipes() => select(recipes).get();
  Future<Recipe?> getRecipeById(int id) =>
      (select(recipes)..where((r) => r.id.equals(id))).getSingleOrNull();
  Future<int> insertRecipe(RecipesCompanion recipe) =>
      into(recipes).insert(recipe);
  Future<bool> updateRecipe(Recipe recipe) => update(recipes).replace(recipe);
  Future<int> deleteRecipe(int id) =>
      (delete(recipes)..where((r) => r.id.equals(id))).go();
}
