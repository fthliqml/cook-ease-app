import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cook_ease_app/views/widgets/app_bottom_nav.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';
import 'package:cook_ease_app/config/themes/app_text_styles.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: 56,
        titleSpacing: 20,
        title: Text(
          title,
          style: AppTextStyles.h1.copyWith(fontSize: 26, letterSpacing: -0.5),
        ),
      ),
      body: SafeArea(child: body),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
