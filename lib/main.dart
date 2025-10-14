import 'package:cook_ease_app/config/routes/app_routes.dart';
import 'package:cook_ease_app/config/themes/app_themes.dart';
import 'package:cook_ease_app/services/app_services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize database and seed from legacy static data if empty
  await AppServices.seedIfEmpty();
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
