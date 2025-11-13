import 'package:flutter/material.dart';
import 'package:cook_ease_app/views/widgets/app_layout.dart';
import 'package:cook_ease_app/views/widgets/recipe_tile.dart';
import 'package:cook_ease_app/viewmodels/favorites_view_model.dart';
import 'package:cook_ease_app/data/local/drift/db_provider.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late final FavoritesViewModel vm;

  @override
  void initState() {
    super.initState();
    final repo = RecipeRepository(DBProvider().database);
    vm = FavoritesViewModel(repo);
    vm.addListener(_onVmChanged);
    vm.init();
  }

  void _onVmChanged() => setState(() {});

  @override
  void dispose() {
    vm.removeListener(_onVmChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Your favorite menu',
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start adding recipes to your favorites!',
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Found ${vm.favorites.length} favorite recipe(s)',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: vm.favorites.length,
                      itemBuilder: (context, index) {
                        final recipe = vm.favorites[index];
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: index < vm.favorites.length - 1 ? 16 : 0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RecipeTile(
                              recipe: recipe,
                              isFavorite: true,
                              onToggleFavorite: () => vm.toggleFavorite(recipe),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
