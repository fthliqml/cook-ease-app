import 'package:flutter/material.dart';
import 'package:cook_ease_app/views/widgets/app_layout.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
      title: 'Your favorite menu',
      body: Center(child: Text('No favorites yet.')),
    );
  }
}
