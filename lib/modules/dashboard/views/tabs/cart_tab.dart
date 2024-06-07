import 'package:devfaru_eccomerce/modules/common/controllers/cart_controller.dart';
import 'package:devfaru_eccomerce/modules/common/models/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTab extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                return buildCartItem(
                    cartController.cartItems[index], cartController);
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GetX<CartController>(
                  builder: (controller) {
                    return Text(
                      '\$${controller.total}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to checkout screen
              },
              icon: Icon(Icons.shopping_bag),
              label: Text('Proceed to Checkout'),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  // Inside buildCartItem method in CartTab
  Widget buildCartItem(CartItem item, CartController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        controller.decreaseQuantity(item);
                      },
                    ),
                    Text(
                      '${item.quantity}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        controller.increaseQuantity(item);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            '\$${item.price}',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
