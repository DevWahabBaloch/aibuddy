import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Signs in with Google and returns the UserCredential if successful.
  static Future<UserCredential?> loginInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        log('Google sign-in canceled');
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        log('Google sign-in error: No access token or ID token');
        Get.snackbar(
          'Error',
          'Google sign-in failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCred = await _auth.signInWithCredential(credential);
      log('Google sign-in successful: ${userCred.user?.uid}');
      Get.snackbar(
        'Success',
        'Logged in with Google successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      return userCred;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      _handleAuthError(e);
      return null;
    } catch (e) {
      log('loginInWithGoogle error: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred during Google sign-in.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  /// Signs in with email and password, returns true on success.
  static Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
      log('Email sign-in successful for: $email');
      Get.snackbar(
        'Success',
        'Logged in successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      _handleAuthError(e);
      return false;
    } catch (e) {
      log('signInWithEmailAndPassword error: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred during sign-in.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  /// Signs up with email and password, returns true on success.
  static Future<bool> signUpWithEmailAndPassword(String userName, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await userCredential.user?.updateDisplayName(userName);
      log('User created successfully: ${userCredential.user?.uid}');
      Get.snackbar(
        'Success',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      _handleAuthError(e);
      return false;
    }
  }

  /// Signs out the current user, returns true on success.
  Future<bool> signOutFromGoogle() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
      log('User signed out successfully');
      return true;
    } catch (e) {
      log('signOutFromGoogle error: $e');
      Get.snackbar(
        'Error',
        'Failed to sign out. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  static void _handleAuthError(FirebaseAuthException e) {
    String message;
    switch (e.code) {
      case 'weak-password':
        message = 'The password is too weak. Use at least 6 characters.';
        break;
      case 'email-already-in-use':
        message = 'This email is already registered. Try logging in or use a different email.';
        break;
      case 'invalid-email':
        message = 'The email address is invalid. Please enter a valid email.';
        break;
      case 'wrong-password':
        message = 'Incorrect password. Please try again.';
        break;
      case 'user-not-found':
        message = 'No user found with this email. Please sign up.';
        break;
      case 'user-disabled':
        message = 'This account has been disabled. Contact support.';
        break;
      case 'too-many-requests':
        message = 'Too many requests. Please try again later.';
        break;
      case 'operation-not-allowed':
        message = 'This operation is not allowed. Contact support.';
        break;
      case 'network-request-failed':
        message = 'Network error. Please check your internet connection.';
        break;
      case 'invalid-credential':
        message = 'Invalid credentials. Please check your email and password.';
        break;
      case 'account-exists-with-different-credential':
        message = 'An account already exists with a different sign-in method. Use the correct provider.';
        break;
      case 'credential-already-in-use':
        message = 'This credential is already linked to another user.';
        break;
      case 'requires-recent-login':
        message = 'This operation requires recent authentication. Please log in again.';
        break;
      case 'provider-already-linked':
        message = 'This provider is already linked to the user account.';
        break;
      case 'invalid-verification-code':
        message = 'Invalid verification code. Please check the OTP and try again.';
        break;
      case 'invalid-verification-id':
        message = 'Invalid verification ID. Please request a new OTP.';
        break;
      case 'channel-error':
        message = 'There was a communication issue with Firebase. Try restarting the app.';
        break;
      default:
        message = 'An unexpected error occurred: ${e.message}';
    }

    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
