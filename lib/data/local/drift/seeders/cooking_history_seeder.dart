import 'package:drift/drift.dart';
import '../app_database.dart';

class CookingHistorySeeder {
  static Future<void> seed(AppDatabase db) async {
    final existingHistory = await db.select(db.cookingHistories).get();
    if (existingHistory.isNotEmpty) {
      print('✅ Cooking history already seeded.');
      return;
    }

    // Get all recipes and steps
    final recipes = await db.select(db.recipes).get();
    if (recipes.isEmpty) {
      print('⚠️ No recipes found. Seed recipes first!');
      return;
    }

    final allSteps = await db.select(db.recipeSteps).get();
    if (allSteps.isEmpty) {
      print('⚠️ No recipe steps found. Seed recipe steps first!');
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

    final now = DateTime.now();

    await db.batch((batch) {
      // History 1: Completed cooking - Nasi Goreng (3 days ago)
      final nasiGoreng = findRecipe('Nasi Goreng Spesial');
      if (nasiGoreng != null) {
        final startTime1 = now.subtract(const Duration(days: 3, hours: 12));
        batch.insert(
          db.cookingHistories,
          CookingHistoriesCompanion.insert(
            recipeId: nasiGoreng.id,
            startedAt: Value(startTime1),
            completedAt: Value(startTime1.add(const Duration(minutes: 22))),
            status: const Value('completed'),
            currentStep: const Value(7),
            notes: const Value('Enak! Anak-anak suka banget'),
          ),
        );
      }

      // History 2: Completed cooking - Gado-Gado (2 days ago)
      final gadoGado = findRecipe('Gado-Gado');
      if (gadoGado != null) {
        final startTime2 = now.subtract(const Duration(days: 2, hours: 13));
        batch.insert(
          db.cookingHistories,
          CookingHistoriesCompanion.insert(
            recipeId: gadoGado.id,
            startedAt: Value(startTime2),
            completedAt: Value(startTime2.add(const Duration(minutes: 18))),
            status: const Value('completed'),
            currentStep: const Value(5),
            notes: const Value('Bumbu kacang perlu lebih manis'),
          ),
        );
      }

      // History 3: Abandoned - Ayam Bakar (today)
      final ayamBakar = findRecipe('Ayam Bakar Madu');
      if (ayamBakar != null) {
        final startTime3 = now.subtract(const Duration(hours: 2));
        batch.insert(
          db.cookingHistories,
          CookingHistoriesCompanion.insert(
            recipeId: ayamBakar.id,
            startedAt: Value(startTime3),
            completedAt: const Value.absent(),
            status: const Value('abandoned'),
            currentStep: const Value(3),
            notes: const Value('Gas habis, harus lanjut besok'),
          ),
        );
      }

      // History 4: Completed - Nasi Goreng again (yesterday)
      if (nasiGoreng != null) {
        final startTime4 = now.subtract(const Duration(days: 1, hours: 19));
        batch.insert(
          db.cookingHistories,
          CookingHistoriesCompanion.insert(
            recipeId: nasiGoreng.id,
            startedAt: Value(startTime4),
            completedAt: Value(startTime4.add(const Duration(minutes: 20))),
            status: const Value('completed'),
            currentStep: const Value(7),
            notes: const Value.absent(),
          ),
        );
      }

      // History 5: Completed - Soto Ayam (1 week ago)
      final sotoAyam = findRecipe('Soto Ayam');
      if (sotoAyam != null) {
        final startTime5 = now.subtract(const Duration(days: 7, hours: 11));
        batch.insert(
          db.cookingHistories,
          CookingHistoriesCompanion.insert(
            recipeId: sotoAyam.id,
            startedAt: Value(startTime5),
            completedAt: Value(startTime5.add(const Duration(minutes: 65))),
            status: const Value('completed'),
            currentStep: const Value(6),
            notes: const Value('Perfect untuk hari hujan!'),
          ),
        );
      }
    });

    print('🌱 Cooking history seeded successfully!');

    // Now seed the step logs for each history
    await _seedStepLogs(db, allSteps);
  }

  static Future<void> _seedStepLogs(
    AppDatabase db,
    List<RecipeStepData> allSteps,
  ) async {
    // Get all histories we just created
    final histories = await db.select(db.cookingHistories).get();

    await db.batch((batch) {
      for (final history in histories) {
        // Get steps for this recipe
        final steps =
            allSteps.where((s) => s.recipeId == history.recipeId).toList()
              ..sort((a, b) => a.stepOrder.compareTo(b.stepOrder));

        DateTime stepStart = history.startedAt;

        // For completed histories, log all steps
        if (history.status == 'completed') {
          for (final step in steps) {
            final stepEnd = stepStart.add(
              Duration(minutes: step.durationMinutes ?? 5),
            );
            batch.insert(
              db.cookingStepLogs,
              CookingStepLogsCompanion.insert(
                cookingHistoryId: history.id,
                recipeStepId: step.id,
                startedAt: Value(stepStart),
                completedAt: Value(stepEnd),
                skipped: const Value(false),
              ),
            );
            stepStart = stepEnd;
          }
        }
        // For abandoned, only log steps up to current_step
        else if (history.status == 'abandoned' && history.currentStep != 0) {
          for (int i = 0; i < history.currentStep && i < steps.length; i++) {
            final step = steps[i];
            final stepEnd = stepStart.add(
              Duration(minutes: step.durationMinutes ?? 5),
            );
            batch.insert(
              db.cookingStepLogs,
              CookingStepLogsCompanion.insert(
                cookingHistoryId: history.id,
                recipeStepId: step.id,
                startedAt: Value(stepStart),
                completedAt: Value(stepEnd),
                skipped: const Value(false),
              ),
            );
            stepStart = stepEnd;
          }
        }
        // For in_progress, log up to current step (last one incomplete)
        else if (history.status == 'in_progress' && history.currentStep != 0) {
          for (int i = 0; i < history.currentStep && i < steps.length; i++) {
            final step = steps[i];
            final isCurrentStep = i == history.currentStep - 1;
            final stepEnd = isCurrentStep
                ? null
                : stepStart.add(Duration(minutes: step.durationMinutes ?? 5));

            batch.insert(
              db.cookingStepLogs,
              CookingStepLogsCompanion.insert(
                cookingHistoryId: history.id,
                recipeStepId: step.id,
                startedAt: Value(stepStart),
                completedAt: stepEnd == null
                    ? const Value.absent()
                    : Value(stepEnd),
                skipped: const Value(false),
              ),
            );

            if (stepEnd != null) {
              stepStart = stepEnd;
            }
          }
        }
      }
    });

    print('🌱 Cooking step logs seeded successfully!');
  }
}

// Example: Seeder untuk skip some steps
class CookingHistoryWithSkipsSeeder {
  static Future<void> seed(AppDatabase db) async {
    // This is optional - adds a history where user skipped some steps
    final recipes = await db.select(db.recipes).get();
    final rendang = recipes.firstWhere(
      (r) => r.title == 'Rendang Daging',
      orElse: () => recipes.first,
    );
    final steps = await (db.select(
      db.recipeSteps,
    )..where((tbl) => tbl.recipeId.equals(rendang.id))).get();

    if (steps.length < 3) return;

    final now = DateTime.now();
    final startTime = now.subtract(const Duration(days: 5, hours: 15));

    // Insert history
    final historyId = await db
        .into(db.cookingHistories)
        .insert(
          CookingHistoriesCompanion.insert(
            recipeId: rendang.id,
            startedAt: Value(startTime),
            completedAt: Value(startTime.add(const Duration(minutes: 90))),
            status: const Value('completed'),
            currentStep: Value(steps.length),
            notes: const Value('Skipped grinding spices, pakai bumbu instant'),
          ),
        );

    // Log steps with some skipped
    await db.batch((batch) {
      DateTime stepStart = startTime;
      for (int i = 0; i < steps.length; i++) {
        final step = steps[i];
        final isSkipped = i == 0; // Skip first step (grinding spices)

        if (isSkipped) {
          batch.insert(
            db.cookingStepLogs,
            CookingStepLogsCompanion.insert(
              cookingHistoryId: historyId,
              recipeStepId: step.id,
              startedAt: Value(stepStart),
              completedAt: Value(stepStart), // Same time = instant skip
              skipped: const Value(true),
            ),
          );
        } else {
          final stepEnd = stepStart.add(
            Duration(minutes: step.durationMinutes ?? 5),
          );
          batch.insert(
            db.cookingStepLogs,
            CookingStepLogsCompanion.insert(
              cookingHistoryId: historyId,
              recipeStepId: step.id,
              startedAt: Value(stepStart),
              completedAt: Value(stepEnd),
              skipped: const Value(false),
            ),
          );
          stepStart = stepEnd;
        }
      }
    });

    print('🌱 Cooking history with skips seeded!');
  }
}
