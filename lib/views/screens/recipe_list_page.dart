import 'package:cook_ease_app/views/widgets/modals/search_filter_modal.dart';
import 'package:flutter/material.dart';
import 'package:cook_ease_app/viewmodels/recipe_list_view_model.dart';
import 'package:cook_ease_app/data/local/drift/db_provider.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';
import 'package:cook_ease_app/views/widgets/app_layout.dart';
import 'package:cook_ease_app/views/widgets/components/modern_recipe_card.dart';
import 'package:cook_ease_app/views/widgets/components/recipe_card_shimmer.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';
import 'package:cook_ease_app/config/themes/app_text_styles.dart';

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
      body: Container(
        color: AppColors.background,
        child: CustomScrollView(
          slivers: [
            // 🔍 Modern Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: _buildModernSearchBar(),
              ),
            ),

            // 🏷️ Category Chips
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildCategoryChips(),
              ),
            ),

            // 📊 Results Counter
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  vm.searchResult.isEmpty
                      ? 'No recipes found'
                      : '${vm.searchResult.length} delicious recipes',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),

            // 🍽️ Recipe Grid
            vm.isLoading
                ? SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => const RecipeCardShimmer(),
                        childCount: 6,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.60,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                    ),
                  )
                : vm.searchResult.isEmpty
                ? SliverFillRemaining(child: _buildEmptyState())
                : SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final recipe = vm.searchResult[index];
                        return ModernRecipeCard(
                          recipe: recipe,
                          isFavorite: recipe.isFavorited,
                          onToggleFavorite: () => vm.toggleFavorite(recipe),
                        );
                      }, childCount: vm.searchResult.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.60,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppColors.softShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchInputController,
              onChanged: _searchRecipes,
              style: AppTextStyles.bodyMedium,
              decoration: InputDecoration(
                hintText: 'Search delicious recipes...',
                hintStyle: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textTertiary,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: AppColors.textSecondary,
                  size: 22,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: const SearchFilterModal(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.tune_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: vm.categories.length,
        itemBuilder: (context, index) {
          final category = vm.categories[index];
          final isSelected = category == vm.selectedCategory;
          return Padding(
            padding: EdgeInsets.only(
              right: index == vm.categories.length - 1 ? 0 : 8,
            ),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (_) => vm.selectCategory(category),
              labelStyle: AppTextStyles.labelMedium.copyWith(
                color: isSelected ? Colors.white : AppColors.primary,
              ),
              backgroundColor: AppColors.surface,
              selectedColor: AppColors.primary,
              shape: StadiumBorder(
                side: BorderSide(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primary.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 80,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: 16),
          Text(
            'No recipes found',
            style: AppTextStyles.h3.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filters',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
