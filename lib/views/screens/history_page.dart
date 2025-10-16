import 'package:flutter/material.dart';
import 'package:cook_ease_app/views/widgets/app_layout.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
      title: 'Your cooking history',
      body: Center(child: Text('History is empty for now.')),
    );
  }
}
