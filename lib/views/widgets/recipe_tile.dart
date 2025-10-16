import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeTile extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback? onToggleFavorite;
  final bool? isFavorite;

  const RecipeTile({
    super.key,
    required this.data,
    this.onToggleFavorite,
    this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final id = (data['id'] ?? '').toString();
    final title = (data['title'] ?? 'No Title').toString();
    final cookTime = (data['cookTime'] ?? '0 min').toString();
    final photoPath = (data['photo'] ?? 'assets/images/placeholder.jpg')
        .toString();
    final fav = isFavorite ?? (data['isFavorite'] as bool?) ?? false;

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
