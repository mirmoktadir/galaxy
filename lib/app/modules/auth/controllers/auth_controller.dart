import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../components/custom_snackbar.dart';
import '../../../routes/app_pages.dart';
import '../../../service/base_controller.dart';

class AuthController extends GetxController with BaseController {
  final loginFormKey = GlobalKey<FormState>();

  String? validateEmail(String email) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }
    return null;
  }

  /// LOGIN
  doLogin(String mail, String password) async {
    bool isValidate = loginFormKey.currentState!.validate();
    isValidate ? showLoading('Login...') : hideLoading();
    try {
      if (isValidate) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: mail.trim(), password: password);

        var authCredential = userCredential.user;

        if (authCredential!.uid.isNotEmpty) {
          loginFormKey.currentState!.save();

          hideLoading();

          Get.offAllNamed(AppPages.HOME);
        }
      }
    } on FirebaseException catch (e) {
      hideLoading();
      if (e.code == "user-not-found") {
        CustomSnackBar.showCustomErrorSnackBar(
            title: "Error", message: "No user found");
      } else if (e.code == "wrong-password") {
        CustomSnackBar.showCustomErrorSnackBar(
            title: "Error", message: "Wrong password");
      }
    } catch (e) {
      hideLoading();
      handleError(e);
    }
  }
}
