import 'package:flutter/material.dart';

/// Central place for static brand colors & gradients.
/// Prefer using Theme.of(context).colorScheme where possible for dynamic theming.
class AppColors {
  AppColors._();

  // Brand seed / primary palette anchors
  // Orange palette
  static const Color primary = Color(0xFFD99651); // Seed
  static const Color primarySoft = Color(0xFFC77B3A);
  static const Color primaryExtraSoft = Color(0xFFFFF4E9); // Very light tint
  static const Color secondary = Color(0xFFFFE3C7); // Soft complementary
  static const Color whiteSoft = Color(0xFFF8F8F8);

  // Gradients
  static LinearGradient bottomShadow = LinearGradient(
    colors: [
      const Color(0xFFD99651).withValues(alpha: 0.2),
      const Color(0xFFD99651).withValues(alpha: 0.0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static LinearGradient linearBlackBottom = LinearGradient(
    colors: [
      Colors.black.withValues(alpha: 0.45),
      Colors.black.withValues(alpha: 0.0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static LinearGradient linearBlackTop = LinearGradient(
    colors: [Colors.black.withValues(alpha: 0.5), Colors.transparent],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
