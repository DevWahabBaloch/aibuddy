import 'package:aibuddy/config/routes/app_routes.dart';
import 'package:aibuddy/features/auth/binding/auth_binding.dart';
import 'package:aibuddy/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static String getInitialRoute() {
    final authController = Get.find<AuthController>();
    return authController.user.value != null ? AppRoute.chatPage.path : AppRoute.authPage.path;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthBinding(),
      initialRoute: getInitialRoute(),
      getPages: AppRoutes.routes,
      navigatorObservers: [GetObserver()],
    );
  }
}
