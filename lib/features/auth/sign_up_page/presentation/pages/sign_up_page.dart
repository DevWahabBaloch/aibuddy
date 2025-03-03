import 'dart:developer';

import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/features/auth/presentation/controllers/auth_controller.dart';
import 'package:aibuddy/features/auth/presentation/widgets/app_button.dart';
import 'package:aibuddy/features/auth/presentation/widgets/app_text_field.dart';
import 'package:aibuddy/features/chat_page/chat_screen.dart';
import 'package:aibuddy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06, top: height * 0.05),
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
                onPressed: () async {
                  await authController.signInWithGoogle();
                  Get.to(const ChatScreen());
                },
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
              SizedBox(height: height * 0.02),
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
                hintText: 'Username',
              ),
              SizedBox(height: height * 0.02),
              AppTextField.password(
                hintText: 'Password',
              ),
              SizedBox(height: height * 0.02),
              AppTextField.password(
                hintText: 'Confirm Password',
              ),
              Text(
                'By signing you agree the Terms of Service and Privacy Policy.\nincluding Cookie Use',
                style: GoogleFonts.roboto(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.02),
              AppButton(
                onPressed: () {
                  log('Sign In button pressed');
                },
                buttonColor: AppColors.buttonColor,
                title: 'Create Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
