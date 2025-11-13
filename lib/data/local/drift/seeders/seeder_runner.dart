import '../app_database.dart';
import 'recipe_seeder.dart';
import 'recipe_step_seeder.dart';
import 'recipe_ingredient_seeder.dart';
import 'cooking_history_seeder.dart';

class SeederRunner {
  static Future<void> run(AppDatabase db) async {
    print('🚀 Starting database seeders...');
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    try {
      // 1. Seed recipes first (no dependencies)
      print('📝 Seeding recipes...');
      await RecipeSeeder.seed(db);

      // 2. Seed recipe steps (depends on recipes)
      print('📋 Seeding recipe steps...');
      await RecipeStepSeeder.seed(db);

      // 3. Seed recipe ingredients (depends on recipes)
      print('🥘 Seeding recipe ingredients...');
      await RecipeIngredientSeeder.seed(db);

      // 4. Seed cooking history & step logs (depends on recipes and steps)
      print('📜 Seeding cooking history...');
      await CookingHistorySeeder.seed(db);

      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('✅ All seeders completed.');

      // Print summary
      await _printSummary(db);
    } catch (e, stackTrace) {
      print('❌ Error during seeding: $e');
      print(stackTrace);
      rethrow;
    }
  }

  /// Optional: Reset all data and reseed
  static Future<void> reset(AppDatabase db) async {
    print('🗑️  Resetting database...');
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    try {
      // Delete in reverse order to respect foreign keys
      print('🧹 Clearing cooking step logs...');
      await db.delete(db.cookingStepLogs).go();

      print('🧹 Clearing cooking histories...');
      await db.delete(db.cookingHistories).go();

      print('🧹 Clearing recipe ingredients...');
      await db.delete(db.recipeIngredients).go();

      print('🧹 Clearing recipe steps...');
      await db.delete(db.recipeSteps).go();

      print('🧹 Clearing recipes...');
      await db.delete(db.recipes).go();

      print('✅ All data cleared.');
      print('');

      // Now seed fresh data
      await run(db);
    } catch (e, stackTrace) {
      print('❌ Error during reset: $e');
      print(stackTrace);
      rethrow;
    }
  }

  /// Print summary of seeded data
  static Future<void> _printSummary(AppDatabase db) async {
    try {
      final recipeCount = await db
          .select(db.recipes)
          .get()
          .then((r) => r.length);
      final stepCount = await db
          .select(db.recipeSteps)
          .get()
          .then((r) => r.length);
      final ingredientCount = await db
          .select(db.recipeIngredients)
          .get()
          .then((r) => r.length);
      final historyCount = await db
          .select(db.cookingHistories)
          .get()
          .then((r) => r.length);
      final logCount = await db
          .select(db.cookingStepLogs)
          .get()
          .then((r) => r.length);

      print('');
      print('📊 Database Summary:');
      print('   • Recipes: $recipeCount');
      print('   • Recipe Steps: $stepCount');
      print('   • Recipe Ingredients: $ingredientCount');
      print('   • Cooking Histories: $historyCount');
      print('   • Step Logs: $logCount');
      print('');
    } catch (e) {
      print('⚠️  Could not print summary: $e');
    }
  }
}

// ═══════════════════════════════════════════════════════════════
// USAGE EXAMPLES:
// ═══════════════════════════════════════════════════════════════

/*
// 1. In your main.dart or app initialization:
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final database = AppDatabase();
  
  // Run seeders (only seeds if data doesn't exist)
  await SeederRunner.run(database);
  
  runApp(MyApp(database: database));
}

// 2. To reset and reseed all data (useful for development/testing):
await SeederRunner.reset(database);

// 3. To manually run seeders in a specific order:
await RecipeSeeder.seed(database);
await RecipeStepSeeder.seed(database);
await CookingHistorySeeder.seed(database);
*/
