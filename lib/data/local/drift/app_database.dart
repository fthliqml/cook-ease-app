import 'package:cook_ease_app/data/local/dao/recipe_dao.dart';
import 'package:cook_ease_app/data/local/dao/recipe_step_dao.dart';
import 'package:cook_ease_app/data/local/dao/recipe_ingredient_dao.dart';
import 'package:cook_ease_app/data/local/dao/cooking_history_dao.dart';
import 'package:cook_ease_app/data/local/dao/cooking_step_log_dao.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/recipes.dart';
import 'tables/recipe_steps.dart';
import 'tables/recipe_ingredients.dart';
import 'tables/cooking_histories.dart';
import 'tables/cooking_step_logs.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Recipes,
    RecipeSteps,
    RecipeIngredients,
    CookingHistories,
    CookingStepLogs,
  ],
  daos: [
    RecipeDao,
    RecipeStepDao,
    RecipeIngredientDao,
    CookingHistoryDao,
    CookingStepLogDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? implementation])
    : super(implementation ?? driftDatabase(name: "cook_ease_sqlite"));

  // Increment version karena ada table baru
  @override
  int get schemaVersion => 3;

  // Strategi migrasi: jalankan createAll() saat pertama kali
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      // Migration dari v1 ke v2: tambah recipe steps, cooking history, logs
      if (from == 1 && to >= 2) {
        await m.createTable(recipeSteps);
        await m.createTable(cookingHistories);
        await m.createTable(cookingStepLogs);
      }
      // Migration dari v2 ke v3: tambah recipe ingredients
      if (from == 2 && to == 3) {
        await m.createTable(recipeIngredients);
      }
      // Migration dari v1 ke v3: tambah semua table baru sekaligus
      if (from == 1 && to == 3) {
        await m.createTable(recipeSteps);
        await m.createTable(recipeIngredients);
        await m.createTable(cookingHistories);
        await m.createTable(cookingStepLogs);
      }
    },
  );
}
