import 'package:devfaru_eccomerce/modules/common/widgets/explore_categories_section.dart';
import 'package:devfaru_eccomerce/modules/common/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search_Bar(),
            ExploreCategoriesSection(),
            // Add more components here (e.g., Featured Products, Promotional Banners, etc.)
          ],
        ),
      ),
    );
  }
}
