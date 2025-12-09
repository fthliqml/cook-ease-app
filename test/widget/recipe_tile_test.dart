import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cook_ease_app/views/widgets/recipe_tile.dart';
import 'package:cook_ease_app/core/models/recipes.dart';

// Mock AssetBundle yang return transparent PNG 1x1 pixel
class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    if (key == 'AssetManifest.bin') {
      // Return empty StandardMessageCodec encoded map
      final codec = StandardMessageCodec();
      final encoded = codec.encodeMessage(<String, Object>{});
      return encoded!;
    }

    // Return 1x1 transparent PNG for images
    final png = Uint8List.fromList([
      0x89,
      0x50,
      0x4E,
      0x47,
      0x0D,
      0x0A,
      0x1A,
      0x0A,
      0x00,
      0x00,
      0x00,
      0x0D,
      0x49,
      0x48,
      0x44,
      0x52,
      0x00,
      0x00,
      0x00,
      0x01,
      0x00,
      0x00,
      0x00,
      0x01,
      0x08,
      0x06,
      0x00,
      0x00,
      0x00,
      0x1F,
      0x15,
      0xC4,
      0x89,
      0x00,
      0x00,
      0x00,
      0x0A,
      0x49,
      0x44,
      0x41,
      0x54,
      0x78,
      0x9C,
      0x63,
      0x00,
      0x01,
      0x00,
      0x00,
      0x05,
      0x00,
      0x01,
      0x0D,
      0x0A,
      0x2D,
      0xB4,
      0x00,
      0x00,
      0x00,
      0x00,
      0x49,
      0x45,
      0x4E,
      0x44,
      0xAE,
      0x42,
      0x60,
      0x82,
    ]);
    return ByteData.view(png.buffer);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('RecipeTile Widget Tests', () {
    late RecipeModel testRecipe;

    setUp(() {
      testRecipe = RecipeModel(
        id: 1,
        title: 'Ayam Bakar',
        description: 'Grilled chicken',
        imgUrl: 'https://example.com/image.jpg',
        cookTime: '45 min',
        category: 'Indonesian',
        difficulty: RecipeDifficulty.three,
        isFavorited: false,
      );
    });

    testWidgets('should find RecipeTile widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        DefaultAssetBundle(
          bundle: TestAssetBundle(),
          child: MaterialApp(
            home: Scaffold(body: RecipeTile(recipe: testRecipe)),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(RecipeTile), findsOneWidget);
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should find InkWell for tap interaction', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        DefaultAssetBundle(
          bundle: TestAssetBundle(),
          child: MaterialApp(
            home: Scaffold(body: RecipeTile(recipe: testRecipe)),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(InkWell), findsAtLeastNWidgets(1));
    });

    testWidgets('should find recipe title text', (WidgetTester tester) async {
      await tester.pumpWidget(
        DefaultAssetBundle(
          bundle: TestAssetBundle(),
          child: MaterialApp(
            home: Scaffold(body: RecipeTile(recipe: testRecipe)),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Ayam Bakar'), findsOneWidget);
    });

    testWidgets('should find cook time text', (WidgetTester tester) async {
      await tester.pumpWidget(
        DefaultAssetBundle(
          bundle: TestAssetBundle(),
          child: MaterialApp(
            home: Scaffold(body: RecipeTile(recipe: testRecipe)),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('45 min'), findsOneWidget);
    });

    testWidgets('should find alarm icon for cook time', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        DefaultAssetBundle(
          bundle: TestAssetBundle(),
          child: MaterialApp(
            home: Scaffold(body: RecipeTile(recipe: testRecipe)),
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.alarm), findsOneWidget);
    });
  });
}
