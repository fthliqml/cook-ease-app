import 'package:flutter/foundation.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';
import 'package:cook_ease_app/core/models/recipes.dart';

class FavoritesViewModel extends ChangeNotifier {
  FavoritesViewModel(this._repo);

  final RecipeRepository _repo;

  bool _loading = false;
  List<RecipeModel> _favorites = [];

  bool get isLoading => _loading;
  List<RecipeModel> get favorites => _favorites;

  Future<void> init() async {
    await loadFavorites();
  }

  Future<void> loadFavorites() async {
    _setLoading(true);
    try {
      _favorites = await _repo.getFavoritedRecipes();
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool v) {
    _loading = v;
    notifyListeners();
  }

  Future<void> toggleFavorite(RecipeModel model) async {
    final newValue = !model.isFavorited;
    // persist
    await _repo.toggleFavorite(model.id, newValue);

    // update local list
    if (newValue) {
      // Add to favorites if not already there
      if (!_favorites.any((m) => m.id == model.id)) {
        _favorites.add(model.copyWith(isFavorited: true));
      }
    } else {
      // Remove from favorites
      _favorites.removeWhere((m) => m.id == model.id);
    }

    notifyListeners();
  }
}
