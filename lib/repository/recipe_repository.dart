import 'package:cook_ease_app/data/local/dao/recipe_dao.dart';
import 'package:cook_ease_app/data/local/drift/app_database.dart';

class RecipeRepository {
  final RecipeDao _recipeDao;

  RecipeRepository(AppDatabase db) : _recipeDao = db.recipeDao;

  // 🔹 Ambil semua resep
  Future<List<Recipe>> getAllRecipes() async {
    return await _recipeDao.getAllRecipes();
  }

  // 🔹 Ambil resep berdasarkan ID
  Future<Recipe?> getRecipeById(int id) async {
    return await _recipeDao.getRecipeById(id);
  }

  // 🔹 Tambah resep baru
  Future<int> insertRecipe(RecipesCompanion recipe) async {
    return await _recipeDao.insertRecipe(recipe);
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
}
