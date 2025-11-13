import 'package:drift/drift.dart';
import '../app_database.dart';

class RecipeIngredientSeeder {
  static Future<void> seed(AppDatabase db) async {
    final existing = await db.select(db.recipeIngredients).get();
    if (existing.isNotEmpty) {
      print('✅ Recipe ingredients already seeded.');
      return;
    }

    // Get all recipes first
    final recipes = await db.select(db.recipes).get();
    if (recipes.isEmpty) {
      print('⚠️ No recipes found. Seed recipes first!');
      return;
    }

    // Helper function to find recipe by title
    Recipe? findRecipe(String title) {
      try {
        return recipes.firstWhere((r) => r.title == title);
      } catch (e) {
        return null;
      }
    }

    await db.batch((batch) {
      // Ingredients for "Nasi Goreng Spesial"
      final nasiGoreng = findRecipe('Nasi Goreng Spesial');
      if (nasiGoreng != null) {
        batch.insertAll(db.recipeIngredients, [
          RecipeIngredientsCompanion.insert(
            recipeId: nasiGoreng.id,
            name: 'Nasi putih dingin',
            amount: '2',
            unit: 'piring',
            order: const Value(1),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: nasiGoreng.id,
            name: 'Telur ayam',
            amount: '2',
            unit: 'butir',
            order: const Value(2),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: nasiGoreng.id,
            name: 'Bawang merah',
            amount: '3',
            unit: 'siung',
            order: const Value(3),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: nasiGoreng.id,
            name: 'Bawang putih',
            amount: '2',
            unit: 'siung',
            order: const Value(4),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: nasiGoreng.id,
            name: 'Kecap manis',
            amount: '2',
            unit: 'sdm',
            order: const Value(5),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: nasiGoreng.id,
            name: 'Garam',
            amount: 'secukupnya',
            unit: '',
            order: const Value(6),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: nasiGoreng.id,
            name: 'Wortel (potong dadu)',
            amount: '1',
            unit: 'buah',
            order: const Value(7),
            isOptional: const Value(true),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: nasiGoreng.id,
            name: 'Kol (iris halus)',
            amount: '100',
            unit: 'gram',
            order: const Value(8),
            isOptional: const Value(true),
          ),
        ]);
      }

      // Ingredients for "Ayam Bakar Madu"
      final ayamBakar = findRecipe('Ayam Bakar Madu');
      if (ayamBakar != null) {
        batch.insertAll(db.recipeIngredients, [
          RecipeIngredientsCompanion.insert(
            recipeId: ayamBakar.id,
            name: 'Ayam kampung (potong 4)',
            amount: '1',
            unit: 'ekor',
            order: const Value(1),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: ayamBakar.id,
            name: 'Madu',
            amount: '3',
            unit: 'sdm',
            order: const Value(2),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: ayamBakar.id,
            name: 'Kecap manis',
            amount: '2',
            unit: 'sdm',
            order: const Value(3),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: ayamBakar.id,
            name: 'Mentega (cair)',
            amount: '2',
            unit: 'sdm',
            order: const Value(4),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: ayamBakar.id,
            name: 'Bawang merah',
            amount: '6',
            unit: 'siung',
            order: const Value(5),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: ayamBakar.id,
            name: 'Bawang putih',
            amount: '4',
            unit: 'siung',
            order: const Value(6),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: ayamBakar.id,
            name: 'Kemiri',
            amount: '3',
            unit: 'butir',
            order: const Value(7),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: ayamBakar.id,
            name: 'Kunyit',
            amount: '2',
            unit: 'cm',
            order: const Value(8),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: ayamBakar.id,
            name: 'Jeruk nipis',
            amount: '1',
            unit: 'buah',
            order: const Value(9),
          ),
        ]);
      }

      // Ingredients for "Soto Ayam"
      final sotoAyam = findRecipe('Soto Ayam');
      if (sotoAyam != null) {
        batch.insertAll(db.recipeIngredients, [
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Ayam kampung',
            amount: '500',
            unit: 'gram',
            order: const Value(1),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Air',
            amount: '1.5',
            unit: 'liter',
            order: const Value(2),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Bihun',
            amount: '100',
            unit: 'gram',
            order: const Value(3),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Tauge',
            amount: '100',
            unit: 'gram',
            order: const Value(4),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Telur rebus',
            amount: '2',
            unit: 'butir',
            order: const Value(5),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Bawang merah',
            amount: '8',
            unit: 'siung',
            order: const Value(6),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Bawang putih',
            amount: '4',
            unit: 'siung',
            order: const Value(7),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Kunyit',
            amount: '2',
            unit: 'cm',
            order: const Value(8),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Jahe',
            amount: '2',
            unit: 'cm',
            order: const Value(9),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Kemiri',
            amount: '3',
            unit: 'butir',
            order: const Value(10),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Serai',
            amount: '2',
            unit: 'batang',
            order: const Value(11),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Daun salam',
            amount: '3',
            unit: 'lembar',
            order: const Value(12),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Bawang goreng',
            amount: 'secukupnya',
            unit: '',
            order: const Value(13),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: sotoAyam.id,
            name: 'Seledri (iris)',
            amount: 'secukupnya',
            unit: '',
            order: const Value(14),
          ),
        ]);
      }

      // Ingredients for "Gado-Gado"
      final gadoGado = findRecipe('Gado-Gado');
      if (gadoGado != null) {
        batch.insertAll(db.recipeIngredients, [
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Kangkung',
            amount: '1',
            unit: 'ikat',
            order: const Value(1),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Kol',
            amount: '¼',
            unit: 'buah',
            order: const Value(2),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Tauge',
            amount: '100',
            unit: 'gram',
            order: const Value(3),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Kacang panjang',
            amount: '5',
            unit: 'batang',
            order: const Value(4),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Tahu putih',
            amount: '4',
            unit: 'potong',
            order: const Value(5),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Tempe',
            amount: '½',
            unit: 'papan',
            order: const Value(6),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Kentang rebus',
            amount: '2',
            unit: 'buah',
            order: const Value(7),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Telur rebus',
            amount: '2',
            unit: 'butir',
            order: const Value(8),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Kacang tanah goreng',
            amount: '200',
            unit: 'gram',
            order: const Value(9),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Gula merah',
            amount: '2',
            unit: 'sdm',
            order: const Value(10),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Asam jawa',
            amount: '1',
            unit: 'sdm',
            order: const Value(11),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: gadoGado.id,
            name: 'Cabai rawit',
            amount: '5',
            unit: 'buah',
            order: const Value(12),
            isOptional: const Value(true),
          ),
        ]);
      }

      // Ingredients for "Rendang Daging"
      final rendang = findRecipe('Rendang Daging');
      if (rendang != null) {
        batch.insertAll(db.recipeIngredients, [
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Daging sapi (potong dadu)',
            amount: '500',
            unit: 'gram',
            order: const Value(1),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Santan kental',
            amount: '1',
            unit: 'liter',
            order: const Value(2),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Bawang merah',
            amount: '10',
            unit: 'siung',
            order: const Value(3),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Bawang putih',
            amount: '6',
            unit: 'siung',
            order: const Value(4),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Cabai merah',
            amount: '10',
            unit: 'buah',
            order: const Value(5),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Jahe',
            amount: '3',
            unit: 'cm',
            order: const Value(6),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Lengkuas',
            amount: '4',
            unit: 'cm',
            order: const Value(7),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Kunyit',
            amount: '3',
            unit: 'cm',
            order: const Value(8),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Kemiri',
            amount: '5',
            unit: 'butir',
            order: const Value(9),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Serai',
            amount: '3',
            unit: 'batang',
            order: const Value(10),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Daun jeruk',
            amount: '5',
            unit: 'lembar',
            order: const Value(11),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Daun kunyit',
            amount: '2',
            unit: 'lembar',
            order: const Value(12),
          ),
          RecipeIngredientsCompanion.insert(
            recipeId: rendang.id,
            name: 'Asam kandis',
            amount: '2',
            unit: 'buah',
            order: const Value(13),
          ),
        ]);
      }
    });

    print('🌱 Recipe ingredients seeded successfully!');
  }
}
