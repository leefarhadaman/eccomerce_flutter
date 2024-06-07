import 'package:devfaru_eccomerce/modules/common/widgets/categories_section.dart';
import 'package:devfaru_eccomerce/modules/common/widgets/featured_products_section.dart';
import 'package:devfaru_eccomerce/modules/common/widgets/promotional_banner.dart';
import 'package:devfaru_eccomerce/modules/common/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/image_carousel.dart';

class HomeTab extends StatelessWidget {
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/4553036/pexels-photo-4553036.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/673803/pexels-photo-673803.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1028637/pexels-photo-1028637.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Search_Bar(),
            ImageCarousel(imageUrls: imageUrls),
            CategoriesSection(),
            FeaturedProductsSection(),
            PromotionalBanner(),
          ],
        ),
      ),
    );
  }
}
