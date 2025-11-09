import 'package:cook_ease_app/data/local/drift/tables/recipes.dart';
import '../app_database.dart';

class RecipeSeeder {
  static Future<void> seed(AppDatabase db) async {
    final existing = await db.select(db.recipes).get();
    if (existing.isNotEmpty) {
      // Detect legacy data (from old AppServices) and refresh if needed
      final categories = existing.map((r) => r.category.trim()).toSet();
      final allGeneral =
          categories.length == 1 && categories.contains('General');
      final allThree = existing.every(
        (r) => r.difficultyLevel == Difficulty.three,
      );

      if (allGeneral || allThree) {
        print(
          '♻️ Legacy recipe data detected (category=General or difficulty=three for all). Refreshing seed...',
        );
        await (db.delete(db.recipes)).go();
      } else {
        print('✅ Recipes already seeded.');
        return;
      }
    }

    await db.batch((batch) {
      batch.insertAll(db.recipes, [
        RecipesCompanion.insert(
          title: 'Nasi Goreng Spesial',
          description:
              'Nasi goreng spesial dengan bumbu rumahan yang kaya rasa.',
          imgUrl: 'assets/images/list1.jpg',
          cookTime: '20 min',
          category: 'Main Course',
          difficultyLevel: Difficulty.one,
          isFavorited: false,
        ),
        RecipesCompanion.insert(
          title: 'Ayam Bakar Madu',
          description: 'Ayam bakar dengan glaze madu, manis-gurih dan juicy.',
          imgUrl: 'assets/images/list2.jpg',
          cookTime: '45 min',
          category: 'Grill',
          difficultyLevel: Difficulty.two,
          isFavorited: false,
        ),
        RecipesCompanion.insert(
          title: 'Soto Ayam',
          description: 'Kuah hangat dengan rempah pilihan dan suwiran ayam.',
          imgUrl: 'assets/images/list3.jpg',
          cookTime: '60 min',
          category: 'Soup',
          difficultyLevel: Difficulty.three,
          isFavorited: false,
        ),
        RecipesCompanion.insert(
          title: 'Gado-Gado',
          description: 'Sayuran segar dengan bumbu kacang creamy.',
          imgUrl: 'assets/images/list4.jpg',
          cookTime: '15 min',
          category: 'Salad',
          difficultyLevel: Difficulty.two,
          isFavorited: false,
        ),
        RecipesCompanion.insert(
          title: 'Rendang Daging',
          description: 'Rendang empuk dengan santan dan rempah yang kaya.',
          imgUrl: 'assets/images/list5.jpg',
          cookTime: '120 min',
          category: 'Main Course',
          difficultyLevel: Difficulty.five,
          isFavorited: false,
        ),
      ]);
    });

    print('🌱 Recipes seeded successfully!');
  }
}
