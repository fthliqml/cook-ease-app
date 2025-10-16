import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cook_ease_app/views/widgets/app_bottom_nav.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: body,
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
