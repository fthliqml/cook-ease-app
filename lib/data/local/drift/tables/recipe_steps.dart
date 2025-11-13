import 'package:drift/drift.dart';
import 'package:cook_ease_app/data/local/drift/tables/recipes.dart';

@DataClassName('RecipeStepData')
class RecipeSteps extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId =>
      integer().references(Recipes, #id, onDelete: KeyAction.cascade)();
  IntColumn get stepOrder => integer()();
  TextColumn get stepTitle => text().withLength(min: 1, max: 200)();
  TextColumn get stepDescription => text()();
  IntColumn get durationMinutes => integer().nullable()();
  TextColumn get timerLabel => text().nullable().withLength(max: 100)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>>? get uniqueKeys => [
    {recipeId, stepOrder}, // Ensure unique step order per recipe
  ];
}
