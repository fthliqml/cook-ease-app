import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';

void main() {
  group('AppColors Tests', () {
    test('should have correct primary color', () {
      // Assert
      expect(AppColors.primary, const Color(0xFF4CAF50));
    });

    test('should have correct secondary color', () {
      // Assert
      expect(AppColors.secondary, const Color(0xFFFF7043));
    });

    test('should have correct background colors', () {
      // Assert
      expect(AppColors.background, const Color(0xFFF7F7F7));
      expect(AppColors.surface, const Color(0xFFFFFFFF));
      expect(AppColors.surfaceVariant, const Color(0xFFF5F5F5));
    });

    test('should have correct text colors', () {
      // Assert
      expect(AppColors.textPrimary, const Color(0xFF1E1E1E));
      expect(AppColors.textSecondary, const Color(0xFF757575));
      expect(AppColors.textTertiary, const Color(0xFFBDBDBD));
    });

    test('should have correct gradient colors', () {
      // Arrange
      final gradient = AppColors.primaryGradient;

      // Assert
      expect(gradient, isA<LinearGradient>());
      expect(gradient.colors.length, 2);
      expect(gradient.colors[0], const Color(0xFF4CAF50));
      expect(gradient.colors[1], const Color(0xFF81C784));
    });

    test('should have correct shadow definitions', () {
      // Arrange
      final cardShadow = AppColors.cardShadowStyle;

      // Assert
      expect(cardShadow, isA<List<BoxShadow>>());
      expect(cardShadow.length, 1);
      expect(cardShadow[0].blurRadius, 20);
      expect(cardShadow[0].offset, const Offset(0, 10));
    });

    test('should have correct semantic colors', () {
      // Assert
      expect(AppColors.success, const Color(0xFF4CAF50));
      expect(AppColors.error, const Color(0xFFF44336));
    });

    test('should have correct accent colors', () {
      // Assert
      expect(AppColors.warning, const Color(0xFFFF9800));
      expect(AppColors.info, const Color(0xFF2196F3));
    });

    test('should have correct gradient begin and end alignment', () {
      // Arrange
      final gradient = AppColors.primaryGradient;

      // Assert
      expect(gradient.begin, Alignment.topLeft);
      expect(gradient.end, Alignment.bottomRight);
    });

    test('should have correct divider color', () {
      // Assert
      expect(AppColors.divider, const Color(0xFFEEEEEE));
    });
  });
}
