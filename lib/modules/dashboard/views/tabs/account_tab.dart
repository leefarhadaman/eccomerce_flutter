import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:devfaru_eccomerce/routes/app_routes.dart';

class AccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            buildSectionTitle(context, 'Profile'),
            buildOption(context, 'Edit Profile', onPressed: () {
              _checkAuthAndNavigate(AppRoutes.ADDPRODUCT);
            }),
            buildOption(context, 'Add Product', onPressed: () {
              _checkAuthAndNavigate(AppRoutes.ADDPRODUCT);
            }),
            SizedBox(height: 24),
            buildSectionTitle(context, 'Navigation'),
            buildOption(context, 'Account', onPressed: () {
              // Navigate to account screen
            }),
            buildOption(context, 'Orders', onPressed: () {
              // Navigate to orders screen
            }),
            buildOption(context, 'Wishlist', onPressed: () {
              // Navigate to wishlist screen
            }),
            buildOption(context, 'Coupons', onPressed: () {
              // Navigate to coupons screen
            }),
            buildOption(context, 'Help Center', onPressed: () {
              // Navigate to help center screen
            }),
            SizedBox(height: 24),
            buildSectionTitle(context, 'Credit Options'),
            buildOption(context, 'Personal Loan', onPressed: () {
              // Navigate to personal loan screen
            }),
            buildOption(context, 'Axis Bank Credit Card', onPressed: () {
              // Navigate to axis bank credit card screen
            }),
            buildOption(context, 'Pay Later', onPressed: () {
              // Navigate to pay later screen
            }),
            SizedBox(height: 24),
            buildSectionTitle(context, 'Credit Score'),
            buildOption(context, 'Free Credit Score Check', onPressed: () {
              // Navigate to credit score check screen
            }),
            SizedBox(height: 24),
            buildSectionTitle(context, 'Other Options'),
            buildOption(context, 'Tap for latest updates and offers',
                onPressed: () {
              // Navigate to latest updates screen
            }),
            SizedBox(height: 24),
            buildSectionTitle(context, 'Account Settings'),
            buildOption(context, 'DevFaru Plus', onPressed: () {
              // Navigate to DevFaru Plus screen
            }),
            buildOption(context, 'Edit Profile', onPressed: () {
              // Navigate to edit profile screen
            }),
            buildOption(context, 'Save Cards & Wallet', onPressed: () {
              // Navigate to save cards & wallet screen
            }),
            buildOption(context, 'Saved Addresses', onPressed: () {
              // Navigate to saved addresses screen
            }),
            buildOption(context, 'Select Language', onPressed: () {
              // Navigate to select language screen
            }),
            buildOption(context, 'Notification Settings', onPressed: () {
              // Navigate to notification settings screen
            }),
          ],
        ),
      ),
    );
  }

  void _checkAuthAndNavigate(String route) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.toNamed(route);
    } else {
      Get.toNamed(AppRoutes.LOGIN);
    }
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget buildOption(BuildContext context, String title,
      {VoidCallback? onPressed}) {
    return ListTile(
      title: Text(title),
      onTap: onPressed,
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
