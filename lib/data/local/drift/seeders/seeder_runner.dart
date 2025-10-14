import '../app_database.dart';
import 'recipe_seeder.dart';

class SeederRunner {
  static Future<void> run(AppDatabase db) async {
    print('🚀 Starting database seeders...');
    await RecipeSeeder.seed(db);
    print('✅ All seeders completed.');
  }
}
