import 'package:devfaru_eccomerce/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _navigateToDashboard();
  }

  void _navigateToDashboard() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(AppRoutes.LOGIN);
  }
}
