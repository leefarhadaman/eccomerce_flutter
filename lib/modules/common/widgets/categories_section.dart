import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devfaru_eccomerce/modules/product/controller/product_controller.dart';
import 'package:devfaru_eccomerce/modules/product/view/product_card.dart'; // Adjust import path as needed

class ProductDisplaySection extends StatelessWidget {
  const ProductDisplaySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    // Fetch products when the widget is first built
    productController.fetchProducts();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Obx(() {
            if (productController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            return GridView.builder(
              shrinkWrap: true,
              itemCount: productController.productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final product = productController.productList[index];
                // Convert price to double
                final price = product['price'] as int;
                final double priceDouble = price.toDouble();
                return GestureDetector(
                  onTap: () {
                    // Navigate to ProductCard with product details
                    Get.to(
                      ProductCard(
                        productName: product['name'],
                        description: product['description'],
                        imageUrl: product['imageUrl'],
                        price: priceDouble,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
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
                        if (product['imageUrl'] != null)
                          Image.network(
                            product['imageUrl'],
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        SizedBox(height: 8),
                        Text(
                          product['name'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${priceDouble.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
