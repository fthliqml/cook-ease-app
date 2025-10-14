import 'package:cook_ease_app/data/local/drift/app_database.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider _instance = DBProvider._();
  factory DBProvider() => _instance;

  AppDatabase? _db;

  AppDatabase get database => _db ??= AppDatabase();
}
