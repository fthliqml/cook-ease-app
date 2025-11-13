import 'package:drift/drift.dart';
import 'package:cook_ease_app/core/models/recipe_ingredient.dart';
import 'package:cook_ease_app/data/local/drift/app_database.dart';
import 'package:cook_ease_app/data/local/drift/tables/recipe_ingredients.dart';

part 'recipe_ingredient_dao.g.dart';

@DriftAccessor(tables: [RecipeIngredients])
class RecipeIngredientDao extends DatabaseAccessor<AppDatabase>
    with _$RecipeIngredientDaoMixin {
  RecipeIngredientDao(AppDatabase db) : super(db);

  /// Get all ingredients for a specific recipe, sorted by order
  Future<List<RecipeIngredientModel>> getIngredientsByRecipeId(
    int recipeId,
  ) async {
    final query = select(recipeIngredients)
      ..where((tbl) => tbl.recipeId.equals(recipeId))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.order)]);

    final results = await query.get();
    return results.map(_toDomain).toList();
  }

  /// Get a single ingredient by ID
  Future<RecipeIngredientModel?> getIngredientById(int ingredientId) async {
    final query = select(recipeIngredients)
      ..where((tbl) => tbl.id.equals(ingredientId));

    final result = await query.getSingleOrNull();
    return result != null ? _toDomain(result) : null;
  }

  /// Insert a single ingredient
  Future<int> insertIngredient(RecipeIngredientModel ingredient) async {
    return into(recipeIngredients).insert(
      RecipeIngredientsCompanion.insert(
        recipeId: ingredient.recipeId,
        name: ingredient.name,
        amount: ingredient.amount,
        unit: ingredient.unit,
        order: Value(ingredient.order),
        isOptional: Value(ingredient.isOptional),
      ),
    );
  }

  /// Insert multiple ingredients at once
  Future<void> insertIngredients(
    List<RecipeIngredientModel> ingredients,
  ) async {
    await batch((batch) {
      batch.insertAll(
        recipeIngredients,
        ingredients
            .map(
              (ingredient) => RecipeIngredientsCompanion.insert(
                recipeId: ingredient.recipeId,
                name: ingredient.name,
                amount: ingredient.amount,
                unit: ingredient.unit,
                order: Value(ingredient.order),
                isOptional: Value(ingredient.isOptional),
              ),
            )
            .toList(),
      );
    });
  }

  /// Update an ingredient
  Future<bool> updateIngredient(RecipeIngredientModel ingredient) async {
    final rowsAffected =
        await (update(
          recipeIngredients,
        )..where((tbl) => tbl.id.equals(ingredient.id))).write(
          RecipeIngredientsCompanion(
            name: Value(ingredient.name),
            amount: Value(ingredient.amount),
            unit: Value(ingredient.unit),
            order: Value(ingredient.order),
            isOptional: Value(ingredient.isOptional),
          ),
        );
    return rowsAffected > 0;
  }

  /// Delete an ingredient by ID
  Future<int> deleteIngredient(int ingredientId) async {
    return await (delete(
      recipeIngredients,
    )..where((tbl) => tbl.id.equals(ingredientId))).go();
  }

  /// Delete all ingredients for a recipe
  Future<int> deleteIngredientsByRecipeId(int recipeId) async {
    return await (delete(
      recipeIngredients,
    )..where((tbl) => tbl.recipeId.equals(recipeId))).go();
  }

  /// Watch ingredients for a recipe (stream)
  Stream<List<RecipeIngredientModel>> watchIngredientsByRecipeId(int recipeId) {
    final query = select(recipeIngredients)
      ..where((tbl) => tbl.recipeId.equals(recipeId))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.order)]);

    return query.watch().map((rows) => rows.map(_toDomain).toList());
  }

  /// Count ingredients for a recipe
  Future<int> countIngredientsByRecipeId(int recipeId) async {
    final query = selectOnly(recipeIngredients)
      ..addColumns([recipeIngredients.id.count()])
      ..where(recipeIngredients.recipeId.equals(recipeId));

    final result = await query.getSingle();
    return result.read(recipeIngredients.id.count()) ?? 0;
  }

  /// Convert Drift data to domain model
  RecipeIngredientModel _toDomain(RecipeIngredientData data) {
    return RecipeIngredientModel(
      id: data.id,
      recipeId: data.recipeId,
      name: data.name,
      amount: data.amount,
      unit: data.unit,
      order: data.order,
      isOptional: data.isOptional,
      createdAt: data.createdAt,
    );
  }
}
