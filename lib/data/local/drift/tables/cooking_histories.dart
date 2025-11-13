import 'package:drift/drift.dart';
import 'package:cook_ease_app/data/local/drift/tables/recipes.dart';

@DataClassName('CookingHistoryData')
class CookingHistories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId =>
      integer().references(Recipes, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get startedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get status => text().withDefault(
    const Constant('in_progress'),
  )(); // 'in_progress', 'completed', 'abandoned'
  IntColumn get currentStep => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
}
