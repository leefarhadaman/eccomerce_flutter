import 'dart:convert';

class CartItem {
  String name;
  int quantity;
  double price;
  String imageUrl;

  CartItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  // Method to convert CartItem to a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  // Factory constructor to create a CartItem instance from a JSON map
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}
