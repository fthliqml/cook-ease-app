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
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        for (final cat in categories)
          ChoiceChip(
            label: Text(cat),
            selected: cat == selected,
            onSelected: (_) => onSelect(cat),
            labelStyle: TextStyle(
              color: cat == selected ? scheme.onPrimary : scheme.primary,
              fontWeight: FontWeight.w600,
            ),
            selectedColor: scheme.primary,
            backgroundColor: Colors.transparent,
            shape: StadiumBorder(side: BorderSide(color: scheme.primary)),
          ),
      ],
    );
  }
}
