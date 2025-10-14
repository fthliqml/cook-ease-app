import 'package:flutter/foundation.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';

class RecipeListViewModel extends ChangeNotifier {
  RecipeListViewModel(this._repo);

  bool _loading = false;
  String _query = '';

  List<Map<String, dynamic>> _all = [];
  List<Map<String, dynamic>> _filtered = [];
  final RecipeRepository _repo;

  final List<String> popularKeywords = [
    'Ayam',
    'Nasi',
    'Sayur',
    'Pedas',
    'Manis',
  ];

  bool get isLoading => _loading;
  String get query => _query;
  List<Map<String, dynamic>> get allRecipes => _all;
  List<Map<String, dynamic>> get searchResult => _filtered;

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
            },
          )
          .toList();
      _applyFilter();
    } finally {
      _setLoading(false);
    }
  }

  void search(String q) {
    _query = q;
    _applyFilter();
  }

  void _applyFilter() {
    if (_query.isEmpty) {
      _filtered = List<Map<String, dynamic>>.from(_all);
    } else {
      final lower = _query.toLowerCase();
      _filtered = _all
          .where(
            (m) => (m['title']?.toString().toLowerCase() ?? '').contains(lower),
          )
          .toList();
    }
    notifyListeners();
  }

  void _setLoading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
