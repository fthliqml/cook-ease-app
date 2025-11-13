import 'package:drift/drift.dart';
import 'package:cook_ease_app/data/local/drift/app_database.dart';
import 'package:cook_ease_app/data/local/drift/tables/cooking_step_logs.dart';
import 'package:cook_ease_app/core/models/cooking_step_log.dart';

part 'cooking_step_log_dao.g.dart';

@DriftAccessor(tables: [CookingStepLogs])
class CookingStepLogDao extends DatabaseAccessor<AppDatabase>
    with _$CookingStepLogDaoMixin {
  CookingStepLogDao(AppDatabase db) : super(db);

  /// Get all step logs for a cooking session
  Future<List<CookingStepLogModel>> getLogsByCookingHistoryId(
    int historyId,
  ) async {
    final query = select(cookingStepLogs)
      ..where((tbl) => tbl.cookingHistoryId.equals(historyId))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.startedAt)]);

    final results = await query.get();
    return results.map((data) => _toDomain(data)).toList();
  }

  /// Get a specific log by ID
  Future<CookingStepLogModel?> getLogById(int logId) async {
    final query = select(cookingStepLogs)..where((tbl) => tbl.id.equals(logId));
    final result = await query.getSingleOrNull();
    return result != null ? _toDomain(result) : null;
  }

  /// Check if a step has been logged in a session
  Future<CookingStepLogModel?> getLogByHistoryAndStep(
    int historyId,
    int stepId,
  ) async {
    final query = select(cookingStepLogs)
      ..where(
        (tbl) =>
            tbl.cookingHistoryId.equals(historyId) &
            tbl.recipeStepId.equals(stepId),
      );

    final result = await query.getSingleOrNull();
    return result != null ? _toDomain(result) : null;
  }

  /// Insert a new step log (start tracking a step)
  Future<int> insertLog(CookingStepLogModel log) async {
    return await into(cookingStepLogs).insert(
      CookingStepLogsCompanion.insert(
        cookingHistoryId: log.cookingHistoryId,
        recipeStepId: log.recipeStepId,
        skipped: Value(log.skipped),
      ),
    );
  }

  /// Update a step log
  Future<bool> updateLog(CookingStepLogModel log) async {
    final updated =
        await (update(
          cookingStepLogs,
        )..where((tbl) => tbl.id.equals(log.id))).write(
          CookingStepLogsCompanion(
            completedAt: Value(log.completedAt),
            skipped: Value(log.skipped),
          ),
        );
    return updated > 0;
  }

  /// Mark a step as completed
  Future<bool> markStepAsCompleted(int logId) async {
    final updated =
        await (update(
          cookingStepLogs,
        )..where((tbl) => tbl.id.equals(logId))).write(
          CookingStepLogsCompanion(
            completedAt: Value(DateTime.now()),
            skipped: const Value(false),
          ),
        );
    return updated > 0;
  }

  /// Mark a step as skipped
  Future<bool> markStepAsSkipped(int logId) async {
    final updated =
        await (update(cookingStepLogs)..where((tbl) => tbl.id.equals(logId)))
            .write(const CookingStepLogsCompanion(skipped: Value(true)));
    return updated > 0;
  }

  /// Delete a specific log
  Future<int> deleteLog(int logId) async {
    return await (delete(
      cookingStepLogs,
    )..where((tbl) => tbl.id.equals(logId))).go();
  }

  /// Delete all logs for a cooking session
  Future<int> deleteLogsByCookingHistoryId(int historyId) async {
    return await (delete(
      cookingStepLogs,
    )..where((tbl) => tbl.cookingHistoryId.equals(historyId))).go();
  }

  /// Watch logs for a cooking session (real-time updates)
  Stream<List<CookingStepLogModel>> watchLogsByCookingHistoryId(int historyId) {
    final query = select(cookingStepLogs)
      ..where((tbl) => tbl.cookingHistoryId.equals(historyId))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.startedAt)]);

    return query.watch().map(
      (rows) => rows.map((row) => _toDomain(row)).toList(),
    );
  }

  /// Get completed steps count for a session
  Future<int> getCompletedStepsCount(int historyId) async {
    final query = selectOnly(cookingStepLogs)
      ..addColumns([cookingStepLogs.id.count()])
      ..where(
        cookingStepLogs.cookingHistoryId.equals(historyId) &
            cookingStepLogs.completedAt.isNotNull() &
            cookingStepLogs.skipped.equals(false),
      );

    final result = await query.getSingleOrNull();
    return result?.read(cookingStepLogs.id.count()) ?? 0;
  }

  /// Convert Drift data to domain model
  CookingStepLogModel _toDomain(CookingStepLogData data) {
    return CookingStepLogModel(
      id: data.id,
      cookingHistoryId: data.cookingHistoryId,
      recipeStepId: data.recipeStepId,
      startedAt: data.startedAt,
      completedAt: data.completedAt,
      skipped: data.skipped,
    );
  }
}
