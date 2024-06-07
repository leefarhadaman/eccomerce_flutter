import 'package:devfaru_eccomerce/modules/dashboard/controllers/dashboard_controllers.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
