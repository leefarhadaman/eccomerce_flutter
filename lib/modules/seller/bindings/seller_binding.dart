import 'package:devfaru_eccomerce/modules/seller/controllers/seller_controller.dart';
import 'package:get/get.dart';

class SellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellerController>(() => SellerController());
  }
}
