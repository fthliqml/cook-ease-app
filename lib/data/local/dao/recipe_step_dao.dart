import 'package:drift/drift.dart';
import 'package:cook_ease_app/data/local/drift/app_database.dart';
import 'package:cook_ease_app/data/local/drift/tables/recipe_steps.dart';
import 'package:cook_ease_app/core/models/recipe_step.dart';

part 'recipe_step_dao.g.dart';

@DriftAccessor(tables: [RecipeSteps])
class RecipeStepDao extends DatabaseAccessor<AppDatabase>
    with _$RecipeStepDaoMixin {
  RecipeStepDao(super.db);

  /// Get all steps for a specific recipe, sorted by step_order
  Future<List<RecipeStepModel>> getStepsByRecipeId(int recipeId) async {
    final query = select(recipeSteps)
      ..where((tbl) => tbl.recipeId.equals(recipeId))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.stepOrder)]);

    final results = await query.get();
    return results.map((data) => _toDomain(data)).toList();
  }

  /// Get a single step by ID
  Future<RecipeStepModel?> getStepById(int stepId) async {
    final query = select(recipeSteps)..where((tbl) => tbl.id.equals(stepId));
    final result = await query.getSingleOrNull();
    return result != null ? _toDomain(result) : null;
  }

  /// Insert a new step
  Future<int> insertStep(RecipeStepModel step) async {
    return await into(recipeSteps).insert(
      RecipeStepsCompanion.insert(
        recipeId: step.recipeId,
        stepOrder: step.stepOrder,
        stepTitle: step.stepTitle,
        stepDescription: step.stepDescription,
        durationMinutes: Value(step.durationMinutes),
        timerLabel: Value(step.timerLabel),
      ),
    );
  }

  /// Insert multiple steps at once (transaction)
  Future<void> insertSteps(List<RecipeStepModel> steps) async {
    await batch((batch) {
      batch.insertAll(
        recipeSteps,
        steps.map(
          (step) => RecipeStepsCompanion.insert(
            recipeId: step.recipeId,
            stepOrder: step.stepOrder,
            stepTitle: step.stepTitle,
            stepDescription: step.stepDescription,
            durationMinutes: Value(step.durationMinutes),
            timerLabel: Value(step.timerLabel),
          ),
        ),
      );
    });
  }

  /// Update an existing step
  Future<bool> updateStep(RecipeStepModel step) async {
    final updated =
        await (update(
          recipeSteps,
        )..where((tbl) => tbl.id.equals(step.id))).write(
          RecipeStepsCompanion(
            stepOrder: Value(step.stepOrder),
            stepTitle: Value(step.stepTitle),
            stepDescription: Value(step.stepDescription),
            durationMinutes: Value(step.durationMinutes),
            timerLabel: Value(step.timerLabel),
          ),
        );
    return updated > 0;
  }

  /// Delete a specific step
  Future<int> deleteStep(int stepId) async {
    return await (delete(
      recipeSteps,
    )..where((tbl) => tbl.id.equals(stepId))).go();
  }

  /// Delete all steps for a specific recipe
  Future<int> deleteStepsByRecipeId(int recipeId) async {
    return await (delete(
      recipeSteps,
    )..where((tbl) => tbl.recipeId.equals(recipeId))).go();
  }

  /// Watch steps for a recipe (real-time updates)
  Stream<List<RecipeStepModel>> watchStepsByRecipeId(int recipeId) {
    final query = select(recipeSteps)
      ..where((tbl) => tbl.recipeId.equals(recipeId))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.stepOrder)]);

    return query.watch().map(
      (rows) => rows.map((row) => _toDomain(row)).toList(),
    );
  }

  /// Convert Drift data to domain model
  RecipeStepModel _toDomain(RecipeStepData data) {
    return RecipeStepModel(
      id: data.id,
      recipeId: data.recipeId,
      stepOrder: data.stepOrder,
      stepTitle: data.stepTitle,
      stepDescription: data.stepDescription,
      durationMinutes: data.durationMinutes,
      timerLabel: data.timerLabel,
      createdAt: data.createdAt,
    );
  }
}
