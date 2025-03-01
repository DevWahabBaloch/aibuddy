import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/features/auth/presentation/widgets/app_text_field.dart';
import 'package:aibuddy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sign in',
                      style: GoogleFonts.roboto(color: AppColors.secondary, fontWeight: FontWeight.bold, fontSize: 30)),
                  Text('Access to your\naccount', style: GoogleFonts.raleway(color: AppColors.secondary)),
                ],
              ),
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
        ],
      ),
    );
  }
}
