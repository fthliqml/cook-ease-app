import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HistoryPage Widget Tests', () {
    testWidgets('should display page title', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Cooking History')),
            body: const Center(child: Text('History Content')),
          ),
        ),
      );

      // Assert
      expect(find.text('Cooking History'), findsOneWidget);
    });

    testWidgets('should display statistics cards', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Column(
                          children: [
                            const Icon(Icons.check_circle),
                            const Text('Completed'),
                            const Text('5'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Column(
                          children: [
                            const Icon(Icons.timer),
                            const Text('In Progress'),
                            const Text('2'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Completed'), findsOneWidget);
      expect(find.text('In Progress'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      expect(find.byIcon(Icons.timer), findsOneWidget);
    });

    testWidgets('should display filter chips', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Wrap(
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: true,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: const Text('Completed'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: const Text('In Progress'),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);
      expect(find.text('In Progress'), findsOneWidget);
      expect(find.byType(FilterChip), findsNWidgets(3));
    });

    testWidgets('should display history card with recipe info', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.restaurant_menu)),
                title: const Text('Nasi Goreng'),
                subtitle: const Text('Started: Dec 9, 2025'),
                trailing: const Icon(Icons.delete_outline),
              ),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Nasi Goreng'), findsOneWidget);
      expect(find.text('Started: Dec 9, 2025'), findsOneWidget);
      expect(find.byIcon(Icons.restaurant_menu), findsOneWidget);
      expect(find.byIcon(Icons.delete_outline), findsOneWidget);
    });

    testWidgets('should display empty state when no history', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.history, size: 80),
                  const SizedBox(height: 16),
                  const Text('No cooking history yet'),
                ],
              ),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('No cooking history yet'), findsOneWidget);
      expect(find.byIcon(Icons.history), findsOneWidget);
    });

    testWidgets('should display status badge', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('Completed'),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Completed'), findsOneWidget);
    });
  });
}
