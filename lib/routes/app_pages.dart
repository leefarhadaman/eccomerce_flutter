import 'package:devfaru_eccomerce/modules/authentication/bindings/auth_binding.dart';
import 'package:devfaru_eccomerce/modules/authentication/view/auth_page.dart';
import 'package:devfaru_eccomerce/modules/dashboard/bindings/dashboard_bindings.dart';
import 'package:devfaru_eccomerce/modules/dashboard/views/dashboard_view.dart';
import 'package:devfaru_eccomerce/modules/product/bindings/product_binding.dart';
import 'package:devfaru_eccomerce/modules/product/view/product_card.dart';
import 'package:devfaru_eccomerce/modules/product/view/product_page.dart';
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
      name: AppRoutes.LOGIN,
      page: () => AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.ADDPRODUCT,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),

  ];
}
