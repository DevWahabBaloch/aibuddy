import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/core/widgets/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AppScaffold(
      body: const Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Sign in',
                    style: TextStyle(color: AppColors.secondary),
                  ),
                  Text('Access to your account', style: TextStyle(color: AppColors.secondary))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
