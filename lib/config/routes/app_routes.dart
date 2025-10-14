import 'package:cook_ease_app/views/screens/recipe_list_page.dart';
import 'package:cook_ease_app/views/screens/recipe_detail_page.dart';
import 'package:cook_ease_app/views/screens/cook_page.dart';
import 'package:cook_ease_app/views/screens/cook_step_page.dart';
import 'package:go_router/go_router.dart';
import 'package:cook_ease_app/views/screens/history_page.dart';
import 'package:cook_ease_app/views/screens/favorites_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/recipes',
  routes: [
    GoRoute(
      path: '/recipes',
      builder: (context, state) => const RecipeListPage(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return RecipeDetailPage(recipeId: id ?? '');
          },
          routes: [
            GoRoute(
              path: 'cook',
              builder: (context, state) {
                final id = state.pathParameters['id'] ?? '';
                return CookPage(recipeId: id);
              },
              routes: [
                GoRoute(
                  path: ':stepId',
                  builder: (context, state) {
                    final id = state.pathParameters['id'] ?? '';
                    final stepId = state.pathParameters['stepId'] ?? '';
                    return CookStepPage(recipeId: id, stepId: stepId);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(path: '/history', builder: (context, state) => const HistoryPage()),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesPage(),
    ),
  ],
);
