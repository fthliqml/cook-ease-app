import 'package:cook_ease_app/config/routes/app_routes.dart';
import 'package:cook_ease_app/config/themes/app_themes.dart';
import 'package:cook_ease_app/data/local/drift/db_provider.dart';
import 'package:cook_ease_app/data/local/drift/seeders/seeder_runner.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Run centralized seeders on a single shared DB instance
  final db = DBProvider().database;
  await SeederRunner.run(db);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CookEase',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
