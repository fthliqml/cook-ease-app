import 'package:cook_ease_app/data/local/dao/recipe_dao.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/recipes.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Recipes], daos: [RecipeDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? implementation])
    : super(implementation ?? driftDatabase(name: "cook_ease_sqlite"));

  // Ubah versi jika ada perubahan tabel atau struktur database.
  @override
  int get schemaVersion => 1;

  // Strategi migrasi: jalankan createAll() saat pertama kali
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      // tambahkan logika migrasi di sini jika versi berubah nanti
    },
  );
}
