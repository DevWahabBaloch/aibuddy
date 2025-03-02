import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/features/auth/presentation/controller/text_field_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  final Widget _child;
  AppTextField({super.key, required String hintText, final TextEditingController? controller})
      : _child = _UsernameTextField(
          hintText: hintText,
          controller: controller,
        );

  AppTextField.password({super.key, required String hintText, final TextEditingController? controller})
      : _child = _PasswordTextField(
          hintText: hintText,
          controller: controller,
        );

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}

class _UsernameTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const _UsernameTextField({
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      controller: controller,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        color: AppColors.secondary,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.onSecondary,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 16,
        ),
        prefixIcon: Icon(Icons.person, color: Colors.grey[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const _PasswordTextField({
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final TextFieldPasswordController textFieldPasswordController = Get.put(TextFieldPasswordController());
    return Obx(() => TextFormField(
          onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
          controller: controller,
          obscureText: textFieldPasswordController.isObscure.value,
          keyboardType: TextInputType.text,
          style: const TextStyle(
            color: AppColors.secondary,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.onSecondary,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
            prefixIcon: Icon(Icons.lock, color: Colors.grey[400]),
            suffixIcon: IconButton(
              icon: Icon(
                textFieldPasswordController.isObscure.value ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[400],
              ),
              onPressed: textFieldPasswordController.toggleVisibility,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
          ),
        ));
  }
}
