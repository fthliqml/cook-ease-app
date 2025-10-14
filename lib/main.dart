import 'package:flutter/material.dart';
import 'package:cook_ease_app/config/routes/app_routes.dart';

class AppTheme {
  static ThemeData get light => ThemeData(primarySwatch: Colors.blue);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CookEase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
