import 'package:drift/drift.dart';
import 'package:cook_ease_app/data/local/drift/tables/cooking_histories.dart';
import 'package:cook_ease_app/data/local/drift/tables/recipe_steps.dart';

@DataClassName('CookingStepLogData')
class CookingStepLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cookingHistoryId => integer().references(
    CookingHistories,
    #id,
    onDelete: KeyAction.cascade,
  )();
  IntColumn get recipeStepId =>
      integer().references(RecipeSteps, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get startedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get completedAt => dateTime().nullable()();
  BoolColumn get skipped => boolean().withDefault(const Constant(false))();

  @override
  List<Set<Column>>? get uniqueKeys => [
    {cookingHistoryId, recipeStepId}, // Ensure unique log per step per session
  ];
}
