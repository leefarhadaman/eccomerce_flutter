import 'dart:convert';
import 'package:devfaru_eccomerce/modules/common/controllers/cart_controller.dart';
import 'package:devfaru_eccomerce/modules/common/models/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double price;
  final String description;
  final String imageUrl;

  const ProductCard({
    required this.productName,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    Future<void> saveCartItemsToLocal(List<CartItem> cartItems) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String cartItemsString = jsonEncode(cartItems);
      await prefs.setString('cartItems', cartItemsString);
    }

    void addToCart() async {
      CartItem item = CartItem(
        name: productName,
        price: price,
        quantity: 1,
        imageUrl: imageUrl,
      );
      cartController.addToCart(item);
      await saveCartItemsToLocal(cartController.cartItems);
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Price: \$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle buy now button tap
                        print('Buy Now tapped for $productName');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // Text color
                      ),
                      child: Text('Buy Now'),
                    ),
                    ElevatedButton(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green, // Text color
                      ),
                      child: Text('Add to Cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
