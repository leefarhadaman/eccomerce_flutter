import 'package:devfaru_eccomerce/modules/common/models/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <CartItem>[
    CartItem(
      name: 'Product 1',
      quantity: 2,
      price: 20,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    CartItem(
      name: 'Product 2',
      quantity: 1,
      price: 15,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    CartItem(
      name: 'Product 3',
      quantity: 3,
      price: 25,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ].obs;

  double get total =>
      cartItems.fold(0, (total, item) => total + item.price * item.quantity);

  void increaseQuantity(CartItem item) {
    item.quantity++;
    update(); // This triggers GetX reactivity to update the UI
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    }
  }
}
