import 'package:aibuddy/features/sign_up/controllers/sign_up_controller.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
