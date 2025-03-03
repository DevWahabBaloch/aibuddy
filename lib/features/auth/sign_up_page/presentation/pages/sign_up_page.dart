import 'dart:developer';

import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/core/extentions/validator_ext.dart';
import 'package:aibuddy/core/mixin/validator.dart';
import 'package:aibuddy/features/auth/presentation/controllers/auth_controller.dart';
import 'package:aibuddy/features/auth/presentation/widgets/app_button.dart';
import 'package:aibuddy/features/auth/presentation/widgets/app_text_field.dart';
import 'package:aibuddy/features/chat_page/chat_screen.dart';
import 'package:aibuddy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with Validator {
  AuthController authController = Get.find<AuthController>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            key: _formKey,
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
                  controller: userNameController,
                  hintText: 'Username',
                ),
                SizedBox(height: height * 0.02),
                AppTextField(
                  hintText: 'Email',
                  validator: (value) {
                    String? emailValidation = value?.emailValidation;
                    if (emailValidation != null) {
                      return emailValidation;
                    }
                    return null;
                  },
                  controller: emailController,
                ),
                SizedBox(height: height * 0.02),
                AppTextField.password(
                  controller: passwordController,
                  hintText: 'Password',
                  validator: passwordValidator,
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'By signing you agree the Terms of Service and Privacy Policy.\nincluding Cookie Use',
                  style: GoogleFonts.roboto(color: AppColors.secondary, fontSize: 11),
                ),
                SizedBox(height: height * 0.02),
                AppButton(
                  onPressed: () {
                    log('Sign In button pressed');
                    _formKey.currentState!.validate();
                  },
                  buttonColor: AppColors.buttonColor,
                  title: 'Create Account',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
