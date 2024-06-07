import 'package:devfaru_eccomerce/modules/customer/bindings/customer_binding.dart';
import 'package:devfaru_eccomerce/modules/customer/views/customer_home_view.dart';
import 'package:devfaru_eccomerce/modules/dashboard/bindings/dashboard_bindings.dart';
import 'package:devfaru_eccomerce/modules/dashboard/views/dashboard_view.dart';
import 'package:devfaru_eccomerce/modules/seller/bindings/seller_binding.dart';
import 'package:devfaru_eccomerce/modules/seller/views/seller_dashboard_view.dart';
import 'package:devfaru_eccomerce/modules/splash/splash_bindings.dart';
import 'package:devfaru_eccomerce/modules/splash/splash_view.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.CUSTOMER_HOME,
      page: () => CustomerHomeView(),
      binding: CustomerBinding(),
    ),
    GetPage(
      name: AppRoutes.SELLER_DASHBOARD,
      page: () => SellerDashboardView(),
      binding: SellerBinding(),
    ),
  ];
}
