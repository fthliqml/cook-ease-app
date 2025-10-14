import 'package:drift/drift.dart';

enum Difficulty { one, two, three, four, five }

class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get imgUrl => text()();
  TextColumn get cookTime => text()();
  TextColumn get category => text()();
  IntColumn get difficultyLevel => intEnum<Difficulty>()();
  BoolColumn get isFavorited => boolean()();
}
