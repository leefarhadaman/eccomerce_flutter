import 'package:flutter/material.dart';

class ExploreCategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock list of categories
    List<String> categories = [
      'Electronics',
      'Clothing',
      'Home & Kitchen',
      'Beauty & Personal Care',
      'Sports & Outdoors',
      'Books',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: categories.map((category) {
              return Chip(
                label: Text(category),
                backgroundColor: Colors.grey[200],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
