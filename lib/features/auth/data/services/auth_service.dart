import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<dynamic> loginInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        log('Google sign-in canceled');
        return null;
      }

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth?.accessToken == null && googleAuth?.idToken == null) {
        log('Google sign-in error: No access token or ID token');
        Get.snackbar('Error', 'Google sign-in failed. Please try again.', snackPosition: SnackPosition.BOTTOM);
        return null;
      }

      final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      log('loginInWithGoogle error: $e');
      Get.snackbar('loginInWithGoogle error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (e) {
      log('signOutFromGoogle error');
      Get.snackbar('signOutFromGoogle error', e.toString(), snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }
}
