// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:aibuddy/core/constants/app_colors.dart';

class AppTextField extends StatelessWidget {
  final Widget _child;
  AppTextField(
      {super.key,
      required String hintText,
      final TextEditingController? controller,
      final String? Function(String?)? validator,
      TextInputType? keyboardType})
      : _child = _UsernameTextField(
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
        );

  AppTextField.password(
      {super.key,
      required String hintText,
      final TextEditingController? controller,
      final String? Function(String?)? validator,
      TextInputType? keyboardType})
      : _child = _PasswordTextField(
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
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
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _UsernameTextField({
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
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

class _PasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _PasswordTextField({
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
  });

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obsecured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      controller: widget.controller,
      validator: widget.validator,
      obscureText: obsecured,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        color: AppColors.secondary,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.onSecondary,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 16,
        ),
        prefixIcon: Icon(Icons.lock, color: Colors.grey[400]),
        suffixIcon: IconButton(
          icon: Icon(
            obsecured ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[400],
          ),
          onPressed: () {
            setState(() {
              obsecured = !obsecured;
            });
          },
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
    );
  }
}
