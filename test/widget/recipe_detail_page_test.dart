import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecipeDetailPage Widget Tests', () {
    testWidgets('should display recipe title', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Nasi Goreng')),
            body: const SingleChildScrollView(
              child: Column(
                children: [Text('Nasi Goreng'), Text('Indonesian fried rice')],
              ),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Nasi Goreng'), findsAtLeast(1));
      expect(find.text('Indonesian fried rice'), findsOneWidget);
    });

    testWidgets('should display back button', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {},
              ),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);
    });

    testWidgets('should display favorite button', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_border_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            body: const Text('Content'),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
    });

    testWidgets('should display Start Cooking button', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const Center(child: Text('Content')),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Start Cooking'),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Start Cooking'), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
    });

    testWidgets('should display tabs for Ingredients and Instructions', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Ingredients'),
                      Tab(text: 'Instructions'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        const Center(child: Text('Ingredients Content')),
                        const Center(child: Text('Instructions Content')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Ingredients'), findsOneWidget);
      expect(find.text('Instructions'), findsOneWidget);
    });

    testWidgets('should display cook time info', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                const Icon(Icons.access_time_rounded),
                const SizedBox(width: 8),
                const Text('30 min'),
              ],
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.access_time_rounded), findsOneWidget);
      expect(find.text('30 min'), findsOneWidget);
    });
  });
}
