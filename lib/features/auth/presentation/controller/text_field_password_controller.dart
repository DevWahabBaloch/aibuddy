import 'package:get/get.dart';

class TextFieldPasswordController extends GetxController {
  final isObscure = true.obs;

  void toggleVisibility() {
    isObscure.value = !isObscure.value;
  }
}
