import 'package:aibuddy/features/auth/binding/auth_binding.dart';
import 'package:aibuddy/features/auth/controller/auth_controller.dart';
import 'package:aibuddy/features/auth/view/auth_page.dart';
import 'package:aibuddy/features/chat_page/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AuthBinding(),
        home: Get.find<AuthController>().user.value != null ? const ChatScreen() : const AuthPage());
  }
}
