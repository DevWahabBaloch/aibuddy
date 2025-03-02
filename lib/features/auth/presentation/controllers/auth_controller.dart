import 'package:aibuddy/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:aibuddy/features/auth/domain/usecases/sign_out_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final SignInWithGoogle signInWithGoogle;
  final SignOutWithGoogle signOutUseCase;

  AuthController({
    required this.signInWithGoogle,
    required this.signOutUseCase,
  });

  var isLoading = false.obs;
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  Future<void> signIn() async {
    isLoading.value = true;
    UserCredential? userCredential = await signInWithGoogle();
    user.value = userCredential?.user;
    isLoading.value = false;
  }

  Future<void> signOut() async {
    isLoading.value = true;

    bool result = await signOutUseCase.call();

    if (result) {
      user.value = null;
    }

    isLoading.value = false;
  }
}
