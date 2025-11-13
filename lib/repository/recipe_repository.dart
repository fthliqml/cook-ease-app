import 'package:cook_ease_app/core/models/recipes.dart';
import 'package:cook_ease_app/data/local/dao/recipe_dao.dart';
import 'package:cook_ease_app/data/local/drift/app_database.dart';
import 'package:cook_ease_app/data/local/drift/tables/recipes.dart';

class RecipeRepository {
  final RecipeDao _recipeDao;

  RecipeRepository(AppDatabase db) : _recipeDao = db.recipeDao;

  // ---- Domain mapping helpers ----
  RecipeModel _toDomain(Recipe r) => RecipeModel(
    id: r.id,
    title: r.title,
    description: r.description,
    imgUrl: r.imgUrl,
    cookTime: r.cookTime,
    category: r.category,
    difficulty: RecipeDifficulty.values[r.difficultyLevel.index],
    isFavorited: r.isFavorited,
  );

  // Drift companion builder from domain (for inserts)
  RecipesCompanion toInsertCompanion(RecipeModel model) =>
      RecipesCompanion.insert(
        title: model.title,
        description: model.description,
        imgUrl: model.imgUrl,
        cookTime: model.cookTime,
        category: model.category,
        difficultyLevel: Difficulty.values[model.difficulty.index],
        isFavorited: model.isFavorited,
      );

  // 🔹 Ambil semua resep
  Future<List<Recipe>> getAllRecipes() async {
    return await _recipeDao.getAllRecipes();
  }

  // Domain: get all recipes
  Future<List<RecipeModel>> getAllRecipeModels() async {
    final list = await _recipeDao.getAllRecipes();
    return list.map(_toDomain).toList();
  }

  // 🔹 Ambil resep berdasarkan ID
  Future<Recipe?> getRecipeById(int id) async {
    return await _recipeDao.getRecipeById(id);
  }

  // Domain: get recipe by id
  Future<RecipeModel?> getRecipeModelById(int id) async {
    final r = await _recipeDao.getRecipeById(id);
    return r == null ? null : _toDomain(r);
  }

  // 🔹 Tambah resep baru
  Future<int> insertRecipe(RecipesCompanion recipe) async {
    return await _recipeDao.insertRecipe(recipe);
  }

  // Domain: insert recipe
  Future<int> insertRecipeModel(RecipeModel model) async {
    return await _recipeDao.insertRecipe(toInsertCompanion(model));
  }

  // 🔹 Update resep
  Future<bool> updateRecipe(Recipe recipe) async {
    return await _recipeDao.updateRecipe(recipe);
  }

  // 🔹 Hapus resep berdasarkan ID
  Future<int> deleteRecipe(int id) async {
    return await _recipeDao.deleteRecipe(id);
  }

  // 🔹 Tandai resep sebagai favorit / tidak favorit
  Future<void> toggleFavorite(int id, bool isFavorited) async {
    final recipe = await _recipeDao.getRecipeById(id);
    if (recipe != null) {
      final updated = recipe.copyWith(isFavorited: isFavorited);
      await _recipeDao.updateRecipe(updated);
    }
  }

  // 🔹 Ambil semua resep yang difavoritkan
  Future<List<RecipeModel>> getFavoritedRecipes() async {
    final list = await _recipeDao.getFavoritedRecipes();
    return list.map(_toDomain).toList();
  }
}
