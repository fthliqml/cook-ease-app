import 'package:flutter/material.dart';

class CookPage extends StatelessWidget {
  final String recipeId;
  const CookPage({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cook')),
      body: Center(child: Text('Cooking recipe ID: $recipeId')),
    );
  }
}
