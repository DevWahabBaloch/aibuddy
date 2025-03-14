import 'dart:developer';

import 'package:aibuddy/core/services/auth_service.dart';
import 'package:aibuddy/features/auth/binding/auth_binding.dart';
import 'package:aibuddy/features/auth/view/auth_page.dart';
import 'package:aibuddy/features/chat_page/view/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  // @override
  // void onReady() {
  //   super.onReady();
  //   _user = Rx<User?>(auth.currentUser);
  //   log('User in onReady: $_user');
  //   // our user would be notified
  //   _user.bindStream(auth.userChanges());
  // }

  // var isLoading = false.obs;

  // Future<void> signIn() async {
  //   isLoading.value = true;
  //   UserCredential? userCredential = await signInWithGoogle();
  //   user.value = userCredential?.user;
  //   isLoading.value = false;
  // }

  // Future<void> signOut() async {
  //   isLoading.value = true;

  //   bool result = await signOutUseCase.call();

  //   if (result) {
  //     user.value = null;
  //   }

  //   isLoading.value = false;
  // }

///////////////////////////////////////////////////////////////////////////////
  final userNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final signupFormKey = GlobalKey<FormState>();

  googleSignUp() async {
    UserCredential? userCredential = await AuthService.loginInWithGoogle();
    if (userCredential != null) {
      log('userCredential == $userCredential .. ${userCredential.additionalUserInfo}.. ${userCredential.user!.email}');
      user.value = userCredential.user;
      Get.offAll(
        const ChatScreen(),
        // binding
      );
    } else {
      Get.offAll(const AuthPage(), binding: AuthBinding());
    }
  }

  Future<bool> signUpWithEmailPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    log('Attempting signup with: username=$username, email=$email');

    try {
      bool isSuccess = await AuthService.signUpWithEmailAndPassword(username, email, password);

      if (isSuccess) {
        user.value = FirebaseAuth.instance.currentUser;
        log('Sign-Up Successful: ${user.value?.email}');
        Get.offAll(const ChatScreen());
        return true;
      } else {
        log('Sign-Up Failed');
        return false;
      }
    } catch (e) {
      log('Sign-Up Error: $e');
      return false;
    }
  }
}
