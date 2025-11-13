import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cook_ease_app/core/models/recipes.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';
import 'package:cook_ease_app/config/themes/app_text_styles.dart';

/// Modern Recipe Card inspired by premium food apps
/// Features: Soft shadows, rounded corners, smooth animations, elegant typography
class ModernRecipeCard extends StatefulWidget {
  final RecipeModel recipe;
  final VoidCallback? onToggleFavorite;
  final bool? isFavorite;

  const ModernRecipeCard({
    super.key,
    required this.recipe,
    this.onToggleFavorite,
    this.isFavorite,
  });

  @override
  State<ModernRecipeCard> createState() => _ModernRecipeCardState();
}

class _ModernRecipeCardState extends State<ModernRecipeCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final id = widget.recipe.id.toString();
    final title = widget.recipe.title;
    final cookTime = widget.recipe.cookTime;
    final category = widget.recipe.category;
    final photoPath = widget.recipe.imgUrl;
    final difficulty = widget.recipe.difficulty.index + 1;

    return GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) {
            setState(() => _isPressed = false);
            if (id.isNotEmpty) context.push('/recipes/$id');
          },
          onTapCancel: () => setState(() => _isPressed = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            transform: Matrix4.identity()..scale(_isPressed ? 0.97 : 1.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(24),
                boxShadow: AppColors.cardShadowStyle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 📸 Image Section with Hero Animation
                  Hero(
                    tag: 'recipe_image_$id',
                    child: Stack(
                      children: [
                        // Image
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 140,
                            color: AppColors.surfaceVariant,
                            child: photoPath.isNotEmpty
                                ? Image.asset(
                                    photoPath,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: AppColors.surfaceVariant,
                                        child: Icon(
                                          Icons.restaurant_menu,
                                          size: 48,
                                          color: AppColors.textTertiary,
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    color: AppColors.surfaceVariant,
                                    child: Icon(
                                      Icons.restaurant_menu,
                                      size: 48,
                                      color: AppColors.textTertiary,
                                    ),
                                  ),
                          ),
                        ),
                        // Gradient Overlay
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withValues(alpha: 0.4),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        // Favorite Button - Hidden in list page
                      ],
                    ),
                  ),

                  // 📝 Content Section
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category Chip
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            category,
                            style: AppTextStyles.chipText.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),

                        // Title
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.h4.copyWith(
                            fontSize: 15,
                            height: 1.3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 7),

                        // Meta Info Row
                        Row(
                          children: [
                            // Cook Time
                            Icon(
                              Icons.access_time_rounded,
                              size: 14,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                cookTime,
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.textSecondary,
                                  fontSize: 11,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),

                            // Difficulty
                            Icon(
                              Icons.local_fire_department_rounded,
                              size: 14,
                              color: AppColors.secondary,
                            ),
                            const SizedBox(width: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(5, (i) {
                                final active = i < difficulty;
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: i == 0 ? 0 : 2,
                                  ),
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: active
                                          ? AppColors.secondary
                                          : AppColors.textTertiary.withValues(
                                              alpha: 0.3,
                                            ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 300.ms, curve: Curves.easeOut)
        .slideY(
          begin: 0.1,
          end: 0,
          duration: 300.ms,
          curve: Curves.easeOutCubic,
        );
  }
}
