import 'package:aibuddy/core/constants/app_colors.dart';
import 'package:aibuddy/features/auth/presentation/controllers/text_field_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  final Widget _child;
  AppTextField(
      {super.key, required String hintText, final TextEditingController? controller, final String? Function(String?)? validator})
      : _child = _UsernameTextField(
          hintText: hintText,
          controller: controller,
          validator: validator,
        );

  AppTextField.password(
      {super.key, required String hintText, final TextEditingController? controller, final String? Function(String?)? validator})
      : _child = _PasswordTextField(
          hintText: hintText,
          controller: controller,
          validator: validator,
        );

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}

class _UsernameTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const _UsernameTextField({
    required this.hintText,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      controller: controller,
      validator: validator,
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
  final String? Function(String?)? validator;

  const _PasswordTextField({
    required this.hintText,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(TextFieldPasswordController());
    return Obx(() => TextFormField(
          onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
          controller: controller,
          validator: validator,
          obscureText: passwordController.isObscure.value,
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
                passwordController.isObscure.value ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[400],
              ),
              onPressed: passwordController.toggleVisibility,
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
