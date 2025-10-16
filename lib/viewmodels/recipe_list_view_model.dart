import 'package:flutter/foundation.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';

class RecipeListViewModel extends ChangeNotifier {
  RecipeListViewModel(this._repo);

  final RecipeRepository _repo;

  bool _loading = false;
  String _query = '';
  String _selectedCategory = 'All';

  List<Map<String, dynamic>> _all = [];
  List<Map<String, dynamic>> _filtered = [];
  List<String> _categories = ['All'];

  bool get isLoading => _loading;
  String get query => _query;
  String get selectedCategory => _selectedCategory;
  List<Map<String, dynamic>> get allRecipes => _all;
  List<Map<String, dynamic>> get searchResult => _filtered;
  List<String> get categories => _categories;

  Future<void> init() async {
    _setLoading(true);
    try {
      final items = await _repo.getAllRecipes();
      _all = items
          .map<Map<String, dynamic>>(
            (r) => {
              'id': r.id.toString(),
              'title': r.title,
              'photo': r.imgUrl,
              'cookTime': r.cookTime,
              'rating': 0.0,
              'description': r.description,
              'category': r.category,
            },
          )
          .toList();

      // Build categories from data
      final cats =
          _all
              .map((m) => (m['category']?.toString() ?? '').trim())
              .where((c) => c.isNotEmpty)
              .toSet()
              .toList()
            ..sort();
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
        : _all
              .where(
                (m) => (m['title']?.toString().toLowerCase() ?? '').contains(
                  lower,
                ),
              )
              .toList();

    if (_selectedCategory == 'All') {
      _filtered = List<Map<String, dynamic>>.from(byQuery);
    } else {
      _filtered = byQuery
          .where((m) => (m['category']?.toString() ?? '') == _selectedCategory)
          .toList();
    }
    notifyListeners();
  }

  void _setLoading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
