import 'package:cook_ease_app/views/widgets/modals/search_filter_modal.dart';
import 'package:flutter/material.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';
import 'package:cook_ease_app/views/widgets/recipe_tile.dart';
import 'package:flutter/services.dart';
import 'package:cook_ease_app/services/app_services.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  late TextEditingController searchInputController;

  // Static data - all recipes
  List<Map<String, dynamic>> allRecipes = [];
  List<Map<String, dynamic>> searchResult = [];
  List<String> popularRecipeKeyword = [];

  @override
  void initState() {
    super.initState();
    searchInputController = TextEditingController();

    // Initialize data
    _initializeData();
  }

  void _initializeData() {
    // Load from repository (converted to map for existing UI)
    AppServices.recipeRepository.getAllRecipes().then((dbItems) {
      final list = dbItems
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
      if (!mounted) return;
      setState(() {
        allRecipes = list;
        searchResult = List.from(allRecipes);
      });
    });
    popularRecipeKeyword = ['Ayam', 'Nasi', 'Sayur', 'Pedas', 'Manis'];
  }

  void _searchRecipes(String query) {
    setState(() {
      if (query.isEmpty) {
        searchResult = List.from(allRecipes);
      } else {
        searchResult = allRecipes.where((recipe) {
          return recipe['title'].toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    searchInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Recipes',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'inter',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Section 1 - Search
          Container(
            width: double.infinity,
            height: 145,
            color: AppColors.primary,
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      // Search TextField
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primarySoft,
                          ),
                          child: TextField(
                            controller: searchInputController,
                            onChanged: _searchRecipes,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              hintText: 'Search recipes...',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.2),
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                maxHeight: 20,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 17,
                              ),
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              prefixIcon: Visibility(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 10,
                                    right: 12,
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Filter Button
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            builder: (context) {
                              return SearchFilterModal();
                            },
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.secondary,
                          ),
                          child: Icon(Icons.tune, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                // Search Keywords
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: popularRecipeKeyword.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8, top: 10),
                        child: OutlinedButton(
                          onPressed: () {
                            searchInputController.text =
                                popularRecipeKeyword[index];
                            _searchRecipes(popularRecipeKeyword[index]);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.15),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            popularRecipeKeyword[index],
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Section 2 - Results (Expanded)
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
                      searchResult.isEmpty
                          ? 'No recipes found'
                          : 'Found ${searchResult.length} recipe(s)',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: searchResult.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: index < searchResult.length - 1 ? 16 : 0,
                          ),
                          child: RecipeTile(data: searchResult[index]),
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
