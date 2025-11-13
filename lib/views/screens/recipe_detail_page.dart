import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';
import 'package:cook_ease_app/config/themes/app_text_styles.dart';
import 'package:cook_ease_app/data/local/drift/db_provider.dart';
import 'package:cook_ease_app/repository/recipe_repository.dart';
import 'package:cook_ease_app/core/models/recipes.dart';
import 'package:cook_ease_app/core/models/recipe_ingredient.dart';
import 'package:cook_ease_app/core/models/recipe_step.dart';
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
    _loadRecipeData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Color appBarColor = Colors.transparent;
  RecipeModel? _model;
  bool _isFavorite = false;
  List<RecipeIngredientModel> _ingredients = [];
  List<RecipeStepModel> _steps = [];
  bool _isLoadingData = true;

  void _loadRecipeData() async {
    final id = int.tryParse(widget.recipeId);
    if (id == null) return;

    final db = DBProvider().database;
    final repo = RecipeRepository(db);

    try {
      // Load recipe details
      final recipe = await repo.getRecipeModelById(id);

      // Load ingredients
      final ingredients = await db.recipeIngredientDao.getIngredientsByRecipeId(
        id,
      );

      // Load steps
      final steps = await db.recipeStepDao.getStepsByRecipeId(id);

      if (!mounted) return;
      setState(() {
        _model = recipe;
        _isFavorite = recipe?.isFavorited ?? false;
        _ingredients = ingredients;
        _steps = steps;
        _isLoadingData = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoadingData = false;
      });
    }
  }

  void _toggleFavorite() async {
    if (_model == null) return;
    final repo = RecipeRepository(DBProvider().database);
    await repo.toggleFavorite(_model!.id, !_isFavorite);
    setState(() {
      _isFavorite = !_isFavorite;
      _model = _model!.copyWith(isFavorited: _isFavorite);
    });

    // Show modern toast notification
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _isFavorite
                    ? 'Added to favorites ❤️'
                    : 'Removed from favorites',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: _isFavorite
            ? AppColors.secondary
            : AppColors.textSecondary.withValues(alpha: 0.9),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
        elevation: 8,
      ),
    );
  }

  void changeAppBarColor(ScrollController scrollController) {
    if (scrollController.position.hasPixels) {
      if (scrollController.position.pixels > 100.0) {
        setState(() {
          appBarColor = AppColors.surface.withValues(alpha: 0.95);
        });
      } else {
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

  @override
  Widget build(BuildContext context) {
    final title = _model?.title ?? 'Recipe';
    final photo = _model?.imgUrl;
    final cookTime = _model?.cookTime ?? '0 min';
    final description = _model?.description ?? 'No data found';
    final id = widget.recipeId;

    return Scaffold(
      backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AnimatedContainer(
          color: appBarColor,
          duration: const Duration(milliseconds: 250),
          child: AppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 0,
            centerTitle: true,
            title: AnimatedOpacity(
              opacity: appBarColor != Colors.transparent ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: Text(
                title,
                style: AppTextStyles.h4.copyWith(
                  color: appBarColor != Colors.transparent
                      ? AppColors.textPrimary
                      : Colors.white,
                ),
              ),
            ),
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: appBarColor != Colors.transparent
                    ? Colors.transparent
                    : Colors.black.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: appBarColor != Colors.transparent
                      ? AppColors.textPrimary
                      : Colors.white,
                  size: 20,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: appBarColor != Colors.transparent
                      ? Colors.transparent
                      : Colors.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    _isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    color: _isFavorite
                        ? AppColors.secondary
                        : (appBarColor != Colors.transparent
                              ? AppColors.textPrimary
                              : Colors.white),
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Modern Start Cooking FAB
      floatingActionButton:
          Container(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => context.push('/recipes/$id/cook'),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Start Cooking',
                            style: AppTextStyles.buttonText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 400.ms, delay: 300.ms)
              .slideY(begin: 0.3, end: 0),
      body: ListView(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          // 📸 Hero Image Section
          Hero(
            tag: 'recipe_image_$id',
            child: Stack(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  color: AppColors.surfaceVariant,
                  child: photo != null && photo.isNotEmpty
                      ? Image.asset(
                          photo,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppColors.surfaceVariant,
                              child: Center(
                                child: Icon(
                                  Icons.restaurant_menu,
                                  size: 80,
                                  color: AppColors.textTertiary,
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Icon(
                            Icons.restaurant_menu,
                            size: 80,
                            color: AppColors.textTertiary,
                          ),
                        ),
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.3),
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 📝 Recipe Info Card
          Transform.translate(
            offset: const Offset(0, -30),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: AppColors.elevatedShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: AppTextStyles.h1.copyWith(fontSize: 26),
                        ),
                        const SizedBox(height: 16),

                        // Meta Info Row
                        Row(
                          children: [
                            _buildMetaChip(
                              Icons.access_time_rounded,
                              cookTime,
                              AppColors.primary,
                            ),
                            const SizedBox(width: 12),
                            _buildMetaChip(
                              Icons.star_rounded,
                              '4.5',
                              AppColors.secondary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Description
                        Text(
                          description,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Tab Bar
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      onTap: (index) =>
                          setState(() => _tabController.index = index),
                      labelColor: Colors.white,
                      unselectedLabelColor: AppColors.textSecondary,
                      labelStyle: AppTextStyles.labelLarge,
                      indicator: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      padding: const EdgeInsets.all(4),
                      tabs: const [
                        Tab(text: 'Ingredients'),
                        Tab(text: 'Instructions'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Tab Content
                  _tabController.index == 0
                      ? _buildIngredientsList()
                      : _buildTutorialList(),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetaChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Text(label, style: AppTextStyles.labelMedium.copyWith(color: color)),
        ],
      ),
    );
  }

  Widget _buildIngredientsList() {
    if (_isLoadingData) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_ingredients.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            'No ingredients available',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = _ingredients[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: ingredient.isOptional
                      ? AppColors.textSecondary
                      : AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(ingredient.name, style: AppTextStyles.bodyMedium),
              ),
              Text(
                '${ingredient.amount} ${ingredient.unit}',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (index * 50).ms).slideX(begin: -0.1, end: 0);
      },
    );
  }

  Widget _buildTutorialList() {
    if (_isLoadingData) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_steps.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(
            'No instructions available',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _steps.length,
      itemBuilder: (context, index) {
        final step = _steps[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '${step.stepOrder}',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (step.stepTitle.isNotEmpty) ...[
                        Text(
                          step.stepTitle,
                          style: AppTextStyles.labelLarge.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      Text(
                        step.stepDescription,
                        style: AppTextStyles.bodyMedium.copyWith(height: 1.5),
                      ),
                      if (step.durationMinutes != null) ...[
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 16,
                              color: AppColors.secondary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${step.durationMinutes} min${step.timerLabel != null ? ' - ${step.timerLabel}' : ''}',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (index * 50).ms).slideX(begin: 0.1, end: 0);
      },
    );
  }
}
