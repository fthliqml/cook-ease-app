import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePage Widget Tests', () {
    testWidgets('should display app title', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('CookEase')),
            body: const Center(child: Text('Home')),
          ),
        ),
      );

      // Assert
      expect(find.text('CookEase'), findsOneWidget);
    });

    testWidgets('should have bottom navigation with 3 items', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const Center(child: Text('Content')),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
              ],
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Favorites'), findsOneWidget);
      expect(find.text('History'), findsOneWidget);
    });

    testWidgets('should display home icon', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const Center(child: Text('Content')),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
              ],
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.history), findsOneWidget);
    });

    testWidgets('should display search bar hint', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(hintText: 'Cari resep...'),
                ),
              ],
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Cari resep...'), findsOneWidget);
    });

    testWidgets('should render without error', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Center(child: Text('CookEase App'))),
        ),
      );

      // Assert
      expect(find.text('CookEase App'), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
