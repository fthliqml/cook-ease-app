import 'package:flutter/foundation.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';
import 'package:cook_ease_app/core/models/recipes.dart';

class RecipeListViewModel extends ChangeNotifier {
  RecipeListViewModel(this._repo);

  final RecipeRepository _repo;

  bool _loading = false;
  String _query = '';
  String _selectedCategory = 'All';

  List<RecipeModel> _all = [];
  List<RecipeModel> _filtered = [];
  List<String> _categories = ['All'];

  bool get isLoading => _loading;
  String get query => _query;
  String get selectedCategory => _selectedCategory;
  List<RecipeModel> get allRecipes => _all;
  List<RecipeModel> get searchResult => _filtered;
  List<String> get categories => _categories;

  Future<void> init() async {
    _setLoading(true);
    try {
      _all = await _repo.getAllRecipeModels();

      // Build categories from data
      final cats = (_all.map(
        (m) => m.category.trim(),
      )..toSet()).where((c) => c.isNotEmpty).toSet().toList()..sort();
      _categories = ['All', ...cats];

      _applyFilter();
    } finally {
      _setLoading(false);
    }
  }

  void search(String q) {
    _query = q;
    _applyFilter();
  }

  void selectCategory(String cat) {
    _selectedCategory = cat;
    _applyFilter();
  }

  void _applyFilter() {
    final lower = _query.toLowerCase();
    final byQuery = _query.isEmpty
        ? _all
        : _all.where((m) => m.title.toLowerCase().contains(lower)).toList();

    if (_selectedCategory == 'All') {
      _filtered = List<RecipeModel>.from(byQuery);
    } else {
      _filtered = byQuery
          .where((m) => m.category == _selectedCategory)
          .toList();
    }
    notifyListeners();
  }

  void _setLoading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
