import 'dart:developer';

import 'package:aibuddy/core/services/auth_service.dart';
import 'package:aibuddy/features/auth/binding/auth_binding.dart';
import 'package:aibuddy/features/auth/view/auth_page.dart';
import 'package:aibuddy/features/chat_page/binding/chat_binding.dart';
import 'package:aibuddy/features/chat_page/view/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final authFormKey = GlobalKey<FormState>();

  Future<bool> signInWithEmailPassword({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      log("Error during sign in: $e");
      return false;
    }
  }

  signInWithGoogle() async {
    UserCredential? userCredential = await AuthService.loginInWithGoogle();
    if (userCredential != null) {
      log('userCredential == $userCredential .. ${userCredential.additionalUserInfo}.. ${userCredential.user!.email}');
      user.value = userCredential.user;
      Get.offAll(const ChatScreen(), binding: ChatBinding());
    } else {
      Get.offAll(const AuthPage(), binding: AuthBinding());
    }
  }
}
