import 'package:cook_ease_app/views/widgets/modals/search_filter_modal.dart';
import 'package:flutter/material.dart';
import 'package:cook_ease_app/views/widgets/recipe_tile.dart';
import 'package:flutter/services.dart';
import 'package:cook_ease_app/viewmodels/recipe_list_view_model.dart';
import 'package:cook_ease_app/data/local/drift/db_provider.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';

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
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Let's Cooking",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section 2 - Search + Filter (white search)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              children: [
                // Search field
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: searchInputController,
                      onChanged: _searchRecipes,
                      maxLines: 1,
                      textInputAction: TextInputAction.search,
                      decoration: const InputDecoration(
                        hintText: 'Search recipes...',
                        prefixIcon: Icon(Icons.search, size: 20),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Filter button (centered icon)
                IconButton.filledTonal(
                  onPressed: () {
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
                  icon: const Icon(Icons.tune),
                  style: IconButton.styleFrom(
                    fixedSize: const Size(48, 48),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Section 3 - Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                for (final cat in vm.categories)
                  Builder(
                    builder: (context) {
                      final active = cat == vm.selectedCategory;
                      final scheme = Theme.of(context).colorScheme;
                      return ChoiceChip(
                        label: Text(cat),
                        selected: active,
                        onSelected: (_) => vm.selectCategory(cat),
                        labelStyle: TextStyle(
                          color: active ? scheme.onPrimary : scheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        selectedColor: scheme.primary,
                        backgroundColor: Colors.transparent,
                        shape: StadiumBorder(
                          side: BorderSide(color: scheme.primary),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),

          // Section 4 - Results (Expanded)
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
