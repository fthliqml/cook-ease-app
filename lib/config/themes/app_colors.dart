import 'package:flutter/material.dart';

/// Modern color palette inspired by premium apps like Gojek, Spotify, Traveloka
class AppColors {
  AppColors._();

  // 🎨 Modern Primary Colors
  static const Color primary = Color(0xFF4CAF50); // Fresh green
  static const Color primaryDark = Color(0xFF388E3C);
  static const Color primaryLight = Color(0xFF81C784);

  static const Color secondary = Color(0xFFFF7043); // Warm orange
  static const Color secondaryDark = Color(0xFFE64A19);
  static const Color secondaryLight = Color(0xFFFFAB91);

  // 🖼️ Background & Surface
  static const Color background = Color(0xFFF7F7F7); // Soft grey background
  static const Color surface = Color(0xFFFFFFFF); // Pure white cards
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // ✍️ Text Colors
  static const Color textPrimary = Color(0xFF1E1E1E); // Almost black
  static const Color textSecondary = Color(0xFF757575); // Medium grey
  static const Color textTertiary = Color(0xFFBDBDBD); // Light grey
  static const Color textOnPrimary = Color(0xFFFFFFFF); // White on colored bg

  // 🎯 Semantic Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // 🌈 Accent Colors
  static const Color accent1 = Color(0xFFFFEB3B); // Yellow
  static const Color accent2 = Color(0xFF9C27B0); // Purple
  static const Color accent3 = Color(0xFF00BCD4); // Cyan

  // 📦 Card & Shadow
  static const Color cardShadow = Color(
    0x0D000000,
  ); // Very soft shadow (opacity 0.05)
  static const Color divider = Color(0xFFEEEEEE);

  // 🎭 Gradients - Modern & Soft
  static LinearGradient primaryGradient = const LinearGradient(
    colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient secondaryGradient = const LinearGradient(
    colors: [Color(0xFFFF7043), Color(0xFFFFAB91)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient overlayGradient = LinearGradient(
    colors: [
      Colors.black.withValues(alpha: 0.6),
      Colors.black.withValues(alpha: 0.0),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static LinearGradient shimmerGradient = LinearGradient(
    colors: [
      const Color(0xFFE0E0E0),
      const Color(0xFFF5F5F5),
      const Color(0xFFE0E0E0),
    ],
  );

  // 📐 Modern Shadows
  static List<BoxShadow> get cardShadowStyle => [
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.05),
      blurRadius: 20,
      offset: const Offset(0, 10),
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get softShadow => [
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.08),
      blurRadius: 12,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  static List<BoxShadow> get elevatedShadow => [
    BoxShadow(
      color: const Color(0xFF000000).withValues(alpha: 0.1),
      blurRadius: 30,
      offset: const Offset(0, 15),
      spreadRadius: 0,
    ),
  ];
}
