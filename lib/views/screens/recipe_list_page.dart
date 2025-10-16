import 'package:cook_ease_app/views/widgets/modals/search_filter_modal.dart';
import 'package:flutter/material.dart';
import 'package:cook_ease_app/views/widgets/recipe_tile.dart';
import 'package:cook_ease_app/viewmodels/recipe_list_view_model.dart';
import 'package:cook_ease_app/data/local/drift/db_provider.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';
import 'package:cook_ease_app/views/widgets/search_filter_bar.dart';
import 'package:cook_ease_app/views/widgets/category_wrap.dart';
import 'package:cook_ease_app/views/widgets/app_layout.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  late TextEditingController searchInputController;
  late final RecipeListViewModel vm;

  @override
  void initState() {
    super.initState();
    searchInputController = TextEditingController();

    // Construct repository using shared DB instance.
    final repo = RecipeRepository(DBProvider().database);
    vm = RecipeListViewModel(repo);
    vm.addListener(_onVmChanged);
    vm.init();
  }

  void _onVmChanged() => setState(() {});

  void _searchRecipes(String query) {
    vm.search(query);
  }

  @override
  void dispose() {
    searchInputController.dispose();
    vm.removeListener(_onVmChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: "Let's Cooking",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 2 - Search + Filter (white search)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: SearchFilterBar(
              controller: searchInputController,
              onChanged: _searchRecipes,
              onFilterTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => const SearchFilterModal(),
                );
              },
            ),
          ),

          // Section 3 - Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CategoryWrap(
              categories: vm.categories,
              selected: vm.selectedCategory,
              onSelect: vm.selectCategory,
            ),
          ),

          // Section 4 - Results
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      vm.searchResult.isEmpty
                          ? 'No recipes found'
                          : 'Found ${vm.searchResult.length} recipe(s)',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: vm.searchResult.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: index < vm.searchResult.length - 1 ? 16 : 0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: RecipeTile(data: vm.searchResult[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
