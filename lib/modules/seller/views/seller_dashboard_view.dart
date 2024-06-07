import 'package:devfaru_eccomerce/modules/seller/controllers/seller_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerDashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SellerController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Dashboard'),
      ),
      body: Center(
        child: Text(
          'Seller Dashboard Content Here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
