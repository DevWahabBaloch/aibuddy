import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aibuddy/core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final Widget _child;

  AppButton({
    super.key,
    required String title,
    VoidCallback? onPressed,
    Color? buttonColor,
    double? borderRadius,
  }) : _child = _TextButton(
          title: title,
          borderRadius: borderRadius,
          buttonColor: buttonColor,
          onPressed: onPressed,
        );

  AppButton.iconTextButton({
    super.key,
    required String title,
    required Widget prefixIcon,
    VoidCallback? onPressed,
    Color? buttonColor,
    double? borderRadius,
  }) : _child = _IconTextButton(
          title: title,
          borderRadius: borderRadius,
          buttonColor: buttonColor,
          onPressed: onPressed,
          prefixIcon: prefixIcon,
        );

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}

class _TextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color? buttonColor;
  final double? borderRadius;

  const _TextButton({
    this.onPressed,
    required this.title,
    this.buttonColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      child: SizedBox(
        width: double.infinity,
        height: height * 0.07,
        child: Card(
          color: buttonColor ?? AppColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.roboto(color: AppColors.secondary),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class _IconTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color? buttonColor;
  final Widget prefixIcon;
  final double? borderRadius;

  const _IconTextButton({
    this.onPressed,
    required this.title,
    required this.prefixIcon,
    this.buttonColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      child: SizedBox(
        width: double.infinity,
        height: height * 0.07,
        child: Card(
          color: buttonColor ?? AppColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              prefixIcon,
              SizedBox(width: width * 0.17),
              Text(
                title,
                style: GoogleFonts.roboto(color: AppColors.secondary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
