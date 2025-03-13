import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static Future<UserCredential?> loginInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        log('Google sign-in canceled');
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null && googleAuth.idToken == null) {
        log('Google sign-in error: No access token or ID token');
        Get.snackbar('Error', 'Google sign-in failed. Please try again.', snackPosition: SnackPosition.BOTTOM);
        return null;
      }

      final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      UserCredential? userCred = await FirebaseAuth.instance.signInWithCredential(credential);
      return userCred;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.message}');
      Get.snackbar('Authentication Error', e.message ?? 'An error occurred', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      log('loginInWithGoogle error: $e');
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  static signInWithEmailAndPassword(String userName, String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error in Sign in', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  static Future<void> signUpWithEmailAndPassword(String userName, String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      log('User created successfully: ${userCredential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'This email is already registered.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        default:
          errorMessage = e.message ?? 'An error occurred during signup.';
      }
      Get.snackbar('Signup Error', errorMessage, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      log('Unexpected error: $e');
      Get.snackbar('Error', 'An unexpected error occurred.', snackPosition: SnackPosition.BOTTOM);
    }
  }

  static Future<bool> signOutFromGoogle() async {
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
