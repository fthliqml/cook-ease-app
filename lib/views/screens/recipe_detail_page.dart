import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';
import 'package:cook_ease_app/data/local/drift/db_provider.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailPage extends StatefulWidget {
  final String recipeId;

  const RecipeDetailPage({super.key, required this.recipeId});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _scrollController.addListener(() {
      changeAppBarColor(_scrollController);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Color appBarColor = Colors.transparent;
  Map<String, dynamic>? _data;

  void changeAppBarColor(ScrollController scrollController) {
    if (scrollController.position.hasPixels) {
      if (scrollController.position.pixels > 2.0) {
        setState(() {
          appBarColor = AppColors.primary;
        });
      }
      if (scrollController.position.pixels <= 2.0) {
        setState(() {
          appBarColor = Colors.transparent;
        });
      }
    } else {
      setState(() {
        appBarColor = Colors.transparent;
      });
    }
  }

  // Get sample data for ingredients and tutorial
  List<Map<String, dynamic>> get ingredients => [
    {'name': 'Nasi putih', 'size': '2 piring'},
    {'name': 'Telur ayam', 'size': '2 butir'},
    {'name': 'Bawang merah', 'size': '3 siung'},
    {'name': 'Bawang putih', 'size': '2 siung'},
    {'name': 'Kecap manis', 'size': '2 sdm'},
    {'name': 'Garam', 'size': 'secukupnya'},
  ];

  List<Map<String, dynamic>> get tutorials => [
    {'step': 1, 'description': 'Panaskan minyak dalam wajan dengan api sedang'},
    {
      'step': 2,
      'description': 'Tumis bawang merah dan bawang putih hingga harum',
    },
    {'step': 3, 'description': 'Masukkan telur, orak-arik hingga matang'},
    {'step': 4, 'description': 'Masukkan nasi putih, aduk rata'},
    {
      'step': 5,
      'description': 'Tambahkan kecap manis dan garam, aduk hingga rata',
    },
    {'step': 6, 'description': 'Masak hingga nasi panas merata, sajikan'},
  ];

  @override
  Widget build(BuildContext context) {
    // lazy load data by id to ensure latest state on rebuilds
    if (_data == null) {
      final id = int.tryParse(widget.recipeId);
      if (id != null) {
        final repo = RecipeRepository(DBProvider().database);
        repo.getRecipeById(id).then((r) {
          if (!mounted) return;
          setState(() {
            _data = r == null
                ? null
                : {
                    'id': r.id.toString(),
                    'title': r.title,
                    'photo': r.imgUrl,
                    'cookTime': r.cookTime,
                    'rating': 0.0,
                    'description': r.description,
                  };
          });
        });
      }
    }
    final data =
        _data ??
        {
          'title': 'Recipe',
          'photo': 'assets/images/placeholder.jpg',
          'cookTime': '0 min',
          'rating': 0.0,
          'description': 'No data found',
        };
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AnimatedContainer(
          color: appBarColor,
          duration: const Duration(milliseconds: 200),
          child: AppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Recipe Detail',
              style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      // Start Cooking FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/recipes/${widget.recipeId}/cook');
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.play_arrow, size: 28, color: Colors.white),
      ),
      body: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Recipe Image
          GestureDetector(
            onTap: () {
              // Full screen image functionality - empty for now
            },
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    data['photo'] ?? 'assets/images/placeholder.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                  ),
                ),
                height: 280,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          // Section 2 - Recipe Info
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 30,
              left: 16,
              right: 16,
            ),
            color: AppColors.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe Rating and Time
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        data['rating']?.toString() ?? '0.0',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.alarm, size: 16, color: Colors.white),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        data['cookTime'] ?? '0 min',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                // Recipe Title
                Container(
                  margin: const EdgeInsets.only(bottom: 12, top: 16),
                  child: Text(
                    data['title'] ?? 'No Title',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'inter',
                    ),
                  ),
                ),
                // Recipe Description
                Text(
                  data['description'] ??
                      'Delicious recipe that you will love to cook and eat.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          // Tabbar ( Ingredients, Tutorial )
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: AppColors.secondary,
            child: TabBar(
              controller: _tabController,
              onTap: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black.withOpacity(0.6),
              labelStyle: const TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: Colors.black,
              tabs: const [
                Tab(text: 'Ingredients'),
                Tab(text: 'Tutorial'),
              ],
            ),
          ),
          // IndexedStack based on TabBar index - only 2 tabs now
          IndexedStack(
            index: _tabController.index,
            children: [
              // Ingredients
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: ingredients.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            ingredients[index]['name'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          ingredients[index]['size'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // Tutorials
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: tutorials.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              tutorials[index]['step'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            tutorials[index]['description'],
                            style: const TextStyle(fontSize: 16, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
