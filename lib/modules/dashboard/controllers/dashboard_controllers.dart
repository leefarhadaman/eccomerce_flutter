import 'package:devfaru_eccomerce/modules/dashboard/views/tabs/account_tab.dart';
import 'package:devfaru_eccomerce/modules/dashboard/views/tabs/cart_tab.dart';
import 'package:devfaru_eccomerce/modules/dashboard/views/tabs/explore_tab.dart';
import 'package:devfaru_eccomerce/modules/dashboard/views/tabs/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> tabs = [
    HomeTab(),
    ExploreTab(),
    CartTab(),
    AccountTab(),
  ];

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
