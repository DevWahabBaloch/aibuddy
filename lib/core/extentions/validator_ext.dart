import 'package:aibuddy/core/constants/app_const.dart';

extension ValidatorExt on String {
  bool get isValidEmail {
    return RegExp(AppConst.emailRegex).hasMatch(this);
  }

  String? get emailValidation {
    if (isEmpty) {
      return 'Email is required.';
    } else if (!isValidEmail) {
      return 'Please enter a valid email.';
    }
    return null; // No error
  }
}
