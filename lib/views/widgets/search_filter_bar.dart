import 'package:flutter/material.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onFilterTap,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onFilterTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        // Search field
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: scheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: scheme.outlineVariant),
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              maxLines: 1,
              style: const TextStyle(fontSize: 14),
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: 'Search recipes...',
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: Icon(Icons.search, size: 18),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        // Filter button (centered icon)
        IconButton.filledTonal(
          onPressed: onFilterTap,
          icon: const Icon(Icons.tune, size: 18),
          style: IconButton.styleFrom(
            fixedSize: const Size(40, 40),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
