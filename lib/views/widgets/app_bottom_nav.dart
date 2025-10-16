import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  int _currentIndexForLocation(String location) {
    if (location.startsWith('/favorites')) return 1;
    if (location.startsWith('/history')) return 2;
    return 0; // default to recipes list
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _currentIndexForLocation(location);

    void onTap(int index) {
      switch (index) {
        case 0:
          context.go('/recipes');
          break;
        case 1:
          context.go('/favorites');
          break;
        case 2:
          context.go('/history');
          break;
      }
    }

    Color colorFor(int index) =>
        index == currentIndex ? scheme.primary : scheme.onSurfaceVariant;

    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: scheme.outlineVariant)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: () => onTap(0),
                icon: const Icon(Icons.list_alt_outlined),
                color: colorFor(0),
                iconSize: 26,
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () => onTap(1),
                icon: const Icon(Icons.favorite_border),
                color: colorFor(1),
                iconSize: 26,
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () => onTap(2),
                icon: const Icon(Icons.history),
                color: colorFor(2),
                iconSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
