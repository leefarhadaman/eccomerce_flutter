import 'package:devfaru_eccomerce/modules/common/models/product.dart';
import 'package:flutter/material.dart';

class FeaturedProductsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock featured products data
    List<Product> featuredProducts = [
      Product(
          name: 'Product 1',
          imageUrl:
              'https://images.pexels.com/photos/20546200/pexels-photo-20546200/free-photo-of-teddy-toy-and-jar-with-hearts.jpeg?auto=compress&cs=tinysrgb&w=600'),
      Product(
          name: 'Product 2',
          imageUrl:
              'https://images.pexels.com/photos/20546200/pexels-photo-20546200/free-photo-of-teddy-toy-and-jar-with-hearts.jpeg?auto=compress&cs=tinysrgb&w=600'),
      Product(
          name: 'Product 3',
          imageUrl:
              'https://images.pexels.com/photos/20546200/pexels-photo-20546200/free-photo-of-teddy-toy-and-jar-with-hearts.jpeg?auto=compress&cs=tinysrgb&w=600'),
      Product(
          name: 'Product 4',
          imageUrl:
              'https://images.pexels.com/photos/20546200/pexels-photo-20546200/free-photo-of-teddy-toy-and-jar-with-hearts.jpeg?auto=compress&cs=tinysrgb&w=600'),
      Product(
          name: 'Product 5',
          imageUrl:
              'https://images.pexels.com/photos/20546200/pexels-photo-20546200/free-photo-of-teddy-toy-and-jar-with-hearts.jpeg?auto=compress&cs=tinysrgb&w=600'),
      Product(
          name: 'Product 6',
          imageUrl:
              'https://images.pexels.com/photos/20546200/pexels-photo-20546200/free-photo-of-teddy-toy-and-jar-with-hearts.jpeg?auto=compress&cs=tinysrgb&w=600'),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 200, // Set maximum height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: featuredProducts.length,
              itemBuilder: (context, index) {
                Product product = featuredProducts[index];
                return GestureDetector(
                  onTap: () {
                    // Handle product tap
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          product.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
