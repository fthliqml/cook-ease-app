import 'package:drift/drift.dart';
import '../app_database.dart';

class RecipeStepSeeder {
  static Future<void> seed(AppDatabase db) async {
    final existing = await db.select(db.recipeSteps).get();
    if (existing.isNotEmpty) {
      print('✅ Recipe steps already seeded.');
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
      // Steps for "Nasi Goreng Spesial"
      final nasiGoreng = findRecipe('Nasi Goreng Spesial');
      if (nasiGoreng != null) {
        batch.insertAll(db.recipeSteps, [
          RecipeStepsCompanion.insert(
            recipeId: nasiGoreng.id,
            stepOrder: 1,
            stepTitle: 'Persiapan Bahan',
            stepDescription:
                'Siapkan nasi putih dingin, telur, bawang merah, bawang putih, kecap manis, dan sayuran (wortel, kol).',
            durationMinutes: const Value(5),
            timerLabel: const Value('Prep time'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: nasiGoreng.id,
            stepOrder: 2,
            stepTitle: 'Tumis Bumbu',
            stepDescription:
                'Panaskan minyak, tumis bawang merah dan bawang putih hingga harum.',
            durationMinutes: const Value(3),
            timerLabel: const Value('Sauté aromatics'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: nasiGoreng.id,
            stepOrder: 3,
            stepTitle: 'Masak Telur',
            stepDescription:
                'Masukkan telur, orak-arik hingga setengah matang.',
            durationMinutes: const Value(2),
            timerLabel: const Value('Cook eggs'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: nasiGoreng.id,
            stepOrder: 4,
            stepTitle: 'Tumis Sayuran',
            stepDescription:
                'Tambahkan sayuran (wortel, kol), tumis hingga layu.',
            durationMinutes: const Value(3),
            timerLabel: const Value('Cook vegetables'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: nasiGoreng.id,
            stepOrder: 5,
            stepTitle: 'Masukkan Nasi',
            stepDescription:
                'Masukkan nasi, aduk rata dengan bumbu dan sayuran.',
            durationMinutes: const Value(4),
            timerLabel: const Value('Fry rice'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: nasiGoreng.id,
            stepOrder: 6,
            stepTitle: 'Bumbui',
            stepDescription:
                'Tambahkan kecap manis, garam, merica, dan penyedap. Aduk rata.',
            durationMinutes: const Value(2),
            timerLabel: const Value('Season'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: nasiGoreng.id,
            stepOrder: 7,
            stepTitle: 'Sajikan',
            stepDescription:
                'Angkat dan sajikan dengan kerupuk, acar, dan telur mata sapi.',
            durationMinutes: const Value(1),
            timerLabel: const Value('Plating'),
          ),
        ]);
      }

      // Steps for "Ayam Bakar Madu"
      final ayamBakar = findRecipe('Ayam Bakar Madu');
      if (ayamBakar != null) {
        batch.insertAll(db.recipeSteps, [
          RecipeStepsCompanion.insert(
            recipeId: ayamBakar.id,
            stepOrder: 1,
            stepTitle: 'Marinasi Ayam',
            stepDescription:
                'Lumuri ayam dengan bumbu halus (bawang merah, bawang putih, kemiri, kunyit), garam, dan jeruk nipis. Diamkan 30 menit.',
            durationMinutes: const Value(30),
            timerLabel: const Value('Marinating'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: ayamBakar.id,
            stepOrder: 2,
            stepTitle: 'Buat Glaze Madu',
            stepDescription:
                'Campur madu, kecap manis, mentega cair, dan sedikit air.',
            durationMinutes: const Value(3),
            timerLabel: const Value('Prepare glaze'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: ayamBakar.id,
            stepOrder: 3,
            stepTitle: 'Panggang Ayam',
            stepDescription:
                'Panggang ayam di atas bara api atau oven 180°C, bolak-balik sesekali.',
            durationMinutes: const Value(20),
            timerLabel: const Value('Grilling'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: ayamBakar.id,
            stepOrder: 4,
            stepTitle: 'Oles Glaze',
            stepDescription:
                'Oles ayam dengan glaze madu setiap 5 menit hingga matang dan berwarna kecokelatan.',
            durationMinutes: const Value(10),
            timerLabel: const Value('Glazing'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: ayamBakar.id,
            stepOrder: 5,
            stepTitle: 'Sajikan',
            stepDescription: 'Angkat, sajikan dengan nasi hangat dan lalapan.',
            durationMinutes: const Value(2),
            timerLabel: const Value('Plating'),
          ),
        ]);
      }

      // Steps for "Soto Ayam"
      final sotoAyam = findRecipe('Soto Ayam');
      if (sotoAyam != null) {
        batch.insertAll(db.recipeSteps, [
          RecipeStepsCompanion.insert(
            recipeId: sotoAyam.id,
            stepOrder: 1,
            stepTitle: 'Rebus Ayam',
            stepDescription:
                'Rebus ayam dengan air, serai, dan daun salam hingga empuk (sekitar 30 menit). Angkat dan suwir ayam.',
            durationMinutes: const Value(30),
            timerLabel: const Value('Boil chicken'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: sotoAyam.id,
            stepOrder: 2,
            stepTitle: 'Haluskan Bumbu',
            stepDescription:
                'Haluskan bawang merah, bawang putih, kemiri, kunyit, jahe, dan merica.',
            durationMinutes: const Value(5),
            timerLabel: const Value('Grind spices'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: sotoAyam.id,
            stepOrder: 3,
            stepTitle: 'Tumis Bumbu',
            stepDescription:
                'Tumis bumbu halus hingga harum dan matang (sekitar 5 menit).',
            durationMinutes: const Value(5),
            timerLabel: const Value('Sauté spices'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: sotoAyam.id,
            stepOrder: 4,
            stepTitle: 'Masak Kuah',
            stepDescription:
                'Masukkan bumbu tumis ke dalam kaldu ayam. Tambahkan garam, gula, dan penyedap. Masak 15 menit.',
            durationMinutes: const Value(15),
            timerLabel: const Value('Simmer broth'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: sotoAyam.id,
            stepOrder: 5,
            stepTitle: 'Siapkan Pelengkap',
            stepDescription:
                'Siapkan bihun rebus, tauge, telur rebus, bawang goreng, dan seledri.',
            durationMinutes: const Value(3),
            timerLabel: const Value('Prep toppings'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: sotoAyam.id,
            stepOrder: 6,
            stepTitle: 'Sajikan',
            stepDescription:
                'Tata bihun, suwir ayam, dan pelengkap di mangkuk. Siram dengan kuah panas. Beri jeruk nipis dan sambal.',
            durationMinutes: const Value(2),
            timerLabel: const Value('Assemble'),
          ),
        ]);
      }

      // Steps for "Gado-Gado"
      final gadoGado = findRecipe('Gado-Gado');
      if (gadoGado != null) {
        batch.insertAll(db.recipeSteps, [
          RecipeStepsCompanion.insert(
            recipeId: gadoGado.id,
            stepOrder: 1,
            stepTitle: 'Rebus Sayuran',
            stepDescription:
                'Rebus kangkung, kol, tauge, kacang panjang secara terpisah. Tiriskan.',
            durationMinutes: const Value(8),
            timerLabel: const Value('Blanch vegetables'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: gadoGado.id,
            stepOrder: 2,
            stepTitle: 'Goreng Tahu & Tempe',
            stepDescription: 'Goreng tahu dan tempe hingga kuning keemasan.',
            durationMinutes: const Value(5),
            timerLabel: const Value('Fry tofu & tempeh'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: gadoGado.id,
            stepOrder: 3,
            stepTitle: 'Buat Bumbu Kacang',
            stepDescription:
                'Haluskan kacang tanah goreng, bawang putih, cabai, gula merah, asam jawa. Campur dengan air hangat hingga kental.',
            durationMinutes: const Value(7),
            timerLabel: const Value('Make peanut sauce'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: gadoGado.id,
            stepOrder: 4,
            stepTitle: 'Tata Sayuran',
            stepDescription:
                'Tata semua sayuran, tahu, tempe, kentang rebus, dan telur rebus di piring.',
            durationMinutes: const Value(2),
            timerLabel: const Value('Arrange'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: gadoGado.id,
            stepOrder: 5,
            stepTitle: 'Siram Bumbu Kacang',
            stepDescription:
                'Siram dengan bumbu kacang. Taburi bawang goreng dan kerupuk.',
            durationMinutes: const Value(1),
            timerLabel: const Value('Finish'),
          ),
        ]);
      }

      // Steps for "Rendang Daging"
      final rendang = findRecipe('Rendang Daging');
      if (rendang != null) {
        batch.insertAll(db.recipeSteps, [
          RecipeStepsCompanion.insert(
            recipeId: rendang.id,
            stepOrder: 1,
            stepTitle: 'Haluskan Bumbu',
            stepDescription:
                'Haluskan bawang merah, bawang putih, cabai merah, jahe, lengkuas, kunyit, kemiri.',
            durationMinutes: const Value(10),
            timerLabel: const Value('Grind spices'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: rendang.id,
            stepOrder: 2,
            stepTitle: 'Tumis Bumbu',
            stepDescription:
                'Tumis bumbu halus dengan minyak hingga harum dan matang (15 menit).',
            durationMinutes: const Value(15),
            timerLabel: const Value('Sauté paste'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: rendang.id,
            stepOrder: 3,
            stepTitle: 'Masak Daging',
            stepDescription:
                'Masukkan potongan daging sapi, aduk rata dengan bumbu.',
            durationMinutes: const Value(5),
            timerLabel: const Value('Brown meat'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: rendang.id,
            stepOrder: 4,
            stepTitle: 'Tambahkan Santan',
            stepDescription:
                'Tuang santan kental, tambahkan serai, daun jeruk, daun kunyit, asam kandis. Aduk rata.',
            durationMinutes: const Value(5),
            timerLabel: const Value('Add coconut milk'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: rendang.id,
            stepOrder: 5,
            stepTitle: 'Masak Hingga Empuk',
            stepDescription:
                'Masak dengan api kecil, aduk sesekali agar tidak gosong. Masak hingga daging empuk dan santan menyusut (sekitar 60 menit).',
            durationMinutes: const Value(60),
            timerLabel: const Value('Slow cook'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: rendang.id,
            stepOrder: 6,
            stepTitle: 'Tumis Hingga Kering',
            stepDescription:
                'Lanjutkan memasak sambil terus diaduk hingga bumbu meresap dan berminyak (20 menit).',
            durationMinutes: const Value(20),
            timerLabel: const Value('Fry until dry'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: rendang.id,
            stepOrder: 7,
            stepTitle: 'Koreksi Rasa',
            stepDescription: 'Cicipi, tambahkan garam atau gula sesuai selera.',
            durationMinutes: const Value(2),
            timerLabel: const Value('Season'),
          ),
          RecipeStepsCompanion.insert(
            recipeId: rendang.id,
            stepOrder: 8,
            stepTitle: 'Sajikan',
            stepDescription: 'Angkat dan sajikan dengan nasi putih hangat.',
            durationMinutes: const Value(1),
            timerLabel: const Value('Serve'),
          ),
        ]);
      }
    });

    print('🌱 Recipe steps seeded successfully!');
  }
}
