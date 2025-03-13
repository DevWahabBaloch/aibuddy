import 'dart:developer';
import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/core/extentions/validator_ext.dart';
import 'package:aibuddy/core/mixin/validator.dart';
import 'package:aibuddy/features/auth/controller/auth_controller.dart';
import 'package:aibuddy/core/widgets/buttons/app_button.dart';
import 'package:aibuddy/core/widgets/text_field/app_text_field.dart';
import 'package:aibuddy/features/chat_page/view/chat_screen.dart';
import 'package:aibuddy/features/sign_up/binding/sign_up_binding.dart';
import 'package:aibuddy/features/sign_up/view/sign_up_page.dart';
import 'package:aibuddy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends GetView<AuthController> with Validator {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
          padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06, top: height * 0.15),
          child: SingleChildScrollView(
            child: Form(
              key: controller.authFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sign in',
                              style: GoogleFonts.roboto(color: AppColors.secondary, fontWeight: FontWeight.bold, fontSize: 30)),
                          Text('Access to your\naccount', style: GoogleFonts.raleway(color: AppColors.secondary)),
                        ],
                      ),
                      Image.asset(Assets.images.bott.path, height: height * 0.2)
                    ],
                  ),
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
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height * 0.02),
                  AppTextField.password(
                    controller: controller.passwordController.value,
                    hintText: 'Password',
                    validator: passwordValidator,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: height * 0.01),
                  AppButton(
                    onPressed: () {
                      log('Sign In button pressed');
                      controller.authFormKey.currentState!.validate();
                      controller.signInWithEmailPassword(
                        email: controller.emailController.value.text,
                        password: controller.passwordController.value.text,
                      );
                      Get.to(const ChatScreen());
                    },
                    buttonColor: AppColors.buttonColor,
                    title: 'Sign In',
                  ),
                  SizedBox(height: height * 0.02),
                  const Text('Don\'t have an account? Sign up',
                      style: TextStyle(
                        color: AppColors.secondary,
                      )),
                  SizedBox(height: height * 0.02),
                  AppButton.iconTextButton(
                    onPressed: () => controller.signInWithGoogle(),
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
                  AppButton.iconTextButton(
                    onPressed: () => Get.off(const SignUpPage(), binding: SignUpBinding()),
                    buttonColor: AppColors.onSecondary,
                    borderRadius: 30,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: height * 0.03,
                        child: Image.asset(
                          Assets.images.messages.path,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    title: 'Sign up with Email',
                  ),
                  // AppButton(
                  //   buttonColor: AppColors.onSecondary,
                  //   borderRadius: 30,
                  //   title: 'Login',
                  // ),
                ],
              ),
            ),
          )),
    );
  }
}
