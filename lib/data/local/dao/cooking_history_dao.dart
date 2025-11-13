import 'package:drift/drift.dart';
import 'package:cook_ease_app/data/local/drift/app_database.dart';
import 'package:cook_ease_app/data/local/drift/tables/cooking_histories.dart';
import 'package:cook_ease_app/core/models/cooking_history.dart';

part 'cooking_history_dao.g.dart';

@DriftAccessor(tables: [CookingHistories])
class CookingHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$CookingHistoryDaoMixin {
  CookingHistoryDao(AppDatabase db) : super(db);

  /// Get all cooking history, sorted by most recent first
  Future<List<CookingHistoryModel>> getAllHistory() async {
    final query = select(cookingHistories)
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)]);

    final results = await query.get();
    return results.map((data) => _toDomain(data)).toList();
  }

  /// Get cooking history for a specific recipe
  Future<List<CookingHistoryModel>> getHistoryByRecipeId(int recipeId) async {
    final query = select(cookingHistories)
      ..where((tbl) => tbl.recipeId.equals(recipeId))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)]);

    final results = await query.get();
    return results.map((data) => _toDomain(data)).toList();
  }

  /// Get currently in-progress cooking sessions
  Future<List<CookingHistoryModel>> getInProgressCooking() async {
    final query = select(cookingHistories)
      ..where((tbl) => tbl.status.equals('in_progress'))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)]);

    final results = await query.get();
    return results.map((data) => _toDomain(data)).toList();
  }

  /// Get a specific cooking history by ID
  Future<CookingHistoryModel?> getHistoryById(int historyId) async {
    final query = select(cookingHistories)
      ..where((tbl) => tbl.id.equals(historyId));
    final result = await query.getSingleOrNull();
    return result != null ? _toDomain(result) : null;
  }

  /// Start a new cooking session
  Future<int> insertHistory(CookingHistoryModel history) async {
    return await into(cookingHistories).insert(
      CookingHistoriesCompanion.insert(
        recipeId: history.recipeId,
        status: Value(history.status.toJson()),
        currentStep: Value(history.currentStep),
        notes: Value(history.notes),
      ),
    );
  }

  /// Update cooking history
  Future<bool> updateHistory(CookingHistoryModel history) async {
    final updated =
        await (update(
          cookingHistories,
        )..where((tbl) => tbl.id.equals(history.id))).write(
          CookingHistoriesCompanion(
            status: Value(history.status.toJson()),
            currentStep: Value(history.currentStep),
            completedAt: Value(history.completedAt),
            notes: Value(history.notes),
          ),
        );
    return updated > 0;
  }

  /// Mark cooking session as completed
  Future<bool> completeHistory(int historyId) async {
    final updated =
        await (update(
          cookingHistories,
        )..where((tbl) => tbl.id.equals(historyId))).write(
          CookingHistoriesCompanion(
            status: const Value('completed'),
            completedAt: Value(DateTime.now()),
          ),
        );
    return updated > 0;
  }

  /// Mark cooking session as abandoned
  Future<bool> abandonHistory(int historyId) async {
    final updated =
        await (update(cookingHistories)
              ..where((tbl) => tbl.id.equals(historyId)))
            .write(const CookingHistoriesCompanion(status: Value('abandoned')));
    return updated > 0;
  }

  /// Delete a cooking history
  Future<int> deleteHistory(int historyId) async {
    return await (delete(
      cookingHistories,
    )..where((tbl) => tbl.id.equals(historyId))).go();
  }

  /// Watch all cooking history (real-time updates)
  Stream<List<CookingHistoryModel>> watchAllHistory() {
    final query = select(cookingHistories)
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)]);

    return query.watch().map(
      (rows) => rows.map((row) => _toDomain(row)).toList(),
    );
  }

  /// Watch in-progress cooking sessions
  Stream<List<CookingHistoryModel>> watchInProgressCooking() {
    final query = select(cookingHistories)
      ..where((tbl) => tbl.status.equals('in_progress'))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)]);

    return query.watch().map(
      (rows) => rows.map((row) => _toDomain(row)).toList(),
    );
  }

  /// Convert Drift data to domain model
  CookingHistoryModel _toDomain(CookingHistoryData data) {
    return CookingHistoryModel(
      id: data.id,
      recipeId: data.recipeId,
      startedAt: data.startedAt,
      completedAt: data.completedAt,
      status: CookingStatus.fromJson(data.status),
      currentStep: data.currentStep,
      notes: data.notes,
    );
  }
}
