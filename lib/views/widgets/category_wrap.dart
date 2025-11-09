import 'package:flutter/material.dart';

class CategoryWrap extends StatelessWidget {
  const CategoryWrap({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelect,
  });

  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
            Padding(
              padding: EdgeInsets.only(
                right: i == categories.length - 1 ? 0 : 8,
              ),
              child: ChoiceChip(
                label: Text(categories[i]),
                selected: categories[i] == selected,
                onSelected: (_) => onSelect(categories[i]),
                labelStyle: TextStyle(
                  color: categories[i] == selected
                      ? scheme.onPrimary
                      : scheme.primary,
                  fontWeight: FontWeight.w600,
                ),
                selectedColor: scheme.primary,
                backgroundColor: Colors.transparent,
                shape: StadiumBorder(side: BorderSide(color: scheme.primary)),
              ),
            ),
        ],
      ),
    );
  }
}
