import 'dart:developer';

import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/core/extentions/validator_ext.dart';
import 'package:aibuddy/core/widgets/buttons/app_button.dart';
import 'package:aibuddy/core/widgets/text_field/app_text_field.dart';
import 'package:aibuddy/features/auth/view/auth_page.dart';
import 'package:aibuddy/features/chat_page/view/chat_screen.dart';
import 'package:aibuddy/features/sign_up/controllers/sign_up_controller.dart';
import 'package:aibuddy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06, top: height * 0.05),
          child: Form(
            key: controller.signupFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'AI Buddy',
                    style: GoogleFonts.caveat(
                      color: AppColors.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Image.asset(
                    Assets.images.bott.path,
                    height: height * 0.2,
                  ),
                  SizedBox(height: height * 0.05),
                  AppButton.iconTextButton(
                    onPressed: () => controller.googleSignUp(),
                    buttonColor: AppColors.onSecondary,
                    borderRadius: 30,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: height * 0.03,
                        child: Image.asset(
                          Assets.images.googleicon.path,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    title: 'Continue with Google',
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    'or',
                    style: GoogleFonts.caveat(
                      color: AppColors.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  AppTextField(
                    controller: controller.userNameController.value,
                    hintText: 'Username',
                  ),
                  SizedBox(height: height * 0.02),
                  AppTextField(
                    controller: controller.emailController.value,
                    hintText: 'Email',
                    validator: (value) {
                      String? emailValidation = value?.emailValidation;
                      if (emailValidation != null) {
                        return emailValidation;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  AppTextField.password(
                    controller: controller.passwordController.value,
                    hintText: 'Password',
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    'By signing you agree the Terms of Service and Privacy Policy.\nincluding Cookie Use',
                    style: GoogleFonts.roboto(color: AppColors.secondary, fontSize: 11),
                  ),
                  SizedBox(height: height * 0.02),
                  AppButton(
                    onPressed: () async {
                      log('Sign up button pressed');
                      if (controller.signupFormKey.currentState!.validate()) {
                        bool isAuthenticated = await controller.signUpWithEmailPassword(
                            username: controller.userNameController.value.text,
                            email: controller.emailController.value.text,
                            password: controller.passwordController.value.text);
                        if (!isAuthenticated) {
                          Get.snackbar("Error", "Invalid email or password",
                              backgroundColor: Colors.red, colorText: Colors.white);
                        }
                      }
                    },
                    buttonColor: AppColors.buttonColor,
                    title: 'Create Account',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
