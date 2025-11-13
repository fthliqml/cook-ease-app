import 'package:drift/drift.dart';
import 'package:cook_ease_app/data/local/drift/tables/recipes.dart';

@DataClassName('RecipeIngredientData')
class RecipeIngredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId =>
      integer().references(Recipes, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get amount => text()();
  TextColumn get unit => text()();
  IntColumn get order => integer().withDefault(const Constant(0))();
  BoolColumn get isOptional => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {recipeId, order}, // Tidak boleh ada duplicate order untuk recipe yang sama
  ];
}
