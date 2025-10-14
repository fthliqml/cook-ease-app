import 'package:flutter/material.dart';
import 'package:cook_ease_app/config/themes/app_colors.dart';
import 'package:go_router/go_router.dart';

class RecipeTile extends StatelessWidget {
  final Map<String, dynamic> data;

  const RecipeTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final id = (data['id'] ?? '').toString();
        if (id.isNotEmpty) {
          context.push('/recipes/$id');
        }
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.whiteSoft,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Recipe Photo
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueGrey,
                image: DecorationImage(
                  image: AssetImage(
                    data['photo'] ?? 'assets/images/placeholder.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Recipe Info
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe title
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        data['title'] ?? 'No Title',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter',
                        ),
                      ),
                    ),
                    // Recipe Rating and Time
                    Row(
                      children: [
                        // Rating with star icon
                        const Icon(Icons.star, color: Colors.orange, size: 14),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            data['rating']?.toString() ?? '0.0',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Time
                        const Icon(Icons.alarm, size: 14, color: Colors.black),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            data['cookTime'] ?? '0 min',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
