import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cook_ease_app/core/models/recipes.dart';

class RecipeTile extends StatelessWidget {
  final RecipeModel recipe;
  final VoidCallback? onToggleFavorite;
  final bool? isFavorite;

  const RecipeTile({
    super.key,
    required this.recipe,
    this.onToggleFavorite,
    this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final id = recipe.id.toString();
    final title = recipe.title;
    final cookTime = recipe.cookTime;
    final photoPath = recipe.imgUrl.isNotEmpty
        ? recipe.imgUrl
        : 'assets/images/placeholder.jpg';
    final fav = isFavorite ?? recipe.isFavorited;

    return Card(
      elevation: 3,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      surfaceTintColor: scheme.surfaceTint,
      child: InkWell(
        onTap: () {
          if (id.isNotEmpty) context.push('/recipes/$id');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image
            SizedBox(
              width: double.infinity,
              height: 160,
              child: Ink.image(image: AssetImage(photoPath), fit: BoxFit.cover),
            ),
            // Info section
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: onToggleFavorite,
                        icon: Icon(
                          fav ? Icons.favorite : Icons.favorite_border_outlined,
                          color: fav ? scheme.primary : scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        size: 16,
                        color: scheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        cookTime,
                        style: TextStyle(
                          fontSize: 13,
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // Category pill
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: scheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          recipe.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Difficulty dots (1..5)
                      Row(
                        children: List.generate(5, (i) {
                          final active = i < (recipe.difficulty.index + 1);
                          return Padding(
                            padding: EdgeInsets.only(left: i == 0 ? 0 : 4),
                            child: Icon(
                              Icons.circle,
                              size: 8,
                              color: active
                                  ? scheme.primary
                                  : scheme.onSurfaceVariant.withValues(
                                      alpha: 0.4,
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
    );
  }
}
