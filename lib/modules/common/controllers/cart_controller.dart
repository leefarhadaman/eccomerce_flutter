import 'dart:convert';

import 'package:devfaru_eccomerce/modules/common/models/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  // Use RxList instead of ObservableList for cart items
  final cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load cart items from SharedPreferences when the controller is initialized
    loadCartItems();
  }

  double get total =>
      cartItems.fold(0, (total, item) => total + item.price * item.quantity);

  void increaseQuantity(CartItem item) {
    item.quantity++;
    update();
    // Save cart items to SharedPreferences after updating
    saveCartItems();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      update();
      // Save cart items to SharedPreferences after updating
      saveCartItems();
    }
  }

  void addToCart(CartItem item) {
    // Check if the item already exists in the cart
    final existingItem = cartItems.firstWhere(
      (cartItem) => cartItem.name == item.name,
      orElse: () => CartItem(
        name: 'Default Item', // Provide default values for the new item
        quantity: 0,
        price: 0,
        imageUrl: '',
      ),
    );

    if (existingItem.name != 'Default Item') {
      // If the item exists, increase its quantity
      increaseQuantity(existingItem);
    } else {
      // If the item doesn't exist, add it to the cart
      cartItems.add(item);
      update();
      // Save cart items to SharedPreferences after updating
      saveCartItems();
    }
  }

  Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartItemsString =
        jsonEncode(cartItems.map((item) => item.toJson()).toList());
    await prefs.setString('cartItems', cartItemsString);
  }

  Future<void> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartItemsString = prefs.getString('cartItems');
    if (cartItemsString != null) {
      Iterable decoded = jsonDecode(cartItemsString);
      cartItems
          .assignAll(decoded.map((item) => CartItem.fromJson(item)).toList());
    }
  }
}
