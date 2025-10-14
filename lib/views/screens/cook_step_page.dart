import 'package:flutter/material.dart';

class CookStepPage extends StatelessWidget {
  final String recipeId;
  final String stepId;
  const CookStepPage({super.key, required this.recipeId, required this.stepId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cook Step')),
      body: Center(child: Text('Recipe: $recipeId, Step: $stepId')),
    );
  }
}
