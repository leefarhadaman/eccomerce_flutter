import 'package:devfaru_eccomerce/routes/app_pages.dart';
import 'package:devfaru_eccomerce/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevFaru E-Commerce App',
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
    );
  }
}
