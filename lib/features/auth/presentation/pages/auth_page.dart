import 'dart:developer';

import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/features/auth/presentation/widgets/app_button.dart';
import 'package:aibuddy/features/auth/presentation/widgets/app_text_field.dart';
import 'package:aibuddy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
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
                    Image.asset(
                      Assets.images.bott.path,
                      height: height * 0.2,
                    )
                  ],
                ),
                AppTextField(
                  hintText: 'Username',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: height * 0.03,
                      width: width * 0.03,
                      child: Image.asset(
                        Assets.images.user.path,
                        fit: BoxFit.contain,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                AppTextField(
                  obscureText: true,
                  onVisibilityToggle: () {},
                  hintText: 'Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: height * 0.03,
                      width: width * 0.03,
                      child: Image.asset(
                        Assets.images.padlock.path,
                        fit: BoxFit.contain,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                AppButton(
                  onPressed: () {
                    log('Sign In button pressed');
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
                AppButton(
                  buttonColor: AppColors.onSecondary,
                  borderRadius: 30,
                  title: 'Login',
                ),
              ],
            )),
      ),
    );
  }
}
