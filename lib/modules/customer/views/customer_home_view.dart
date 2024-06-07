import 'package:devfaru_eccomerce/modules/customer/controllers/customer_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CustomerController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Home'),
      ),
      body: Center(
        child: Text(
          'Customer Home Content Here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
