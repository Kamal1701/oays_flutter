import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/controllers/oays_authentication_repositary.dart';

class OAYSSignInController extends GetxController {
  static OAYSSignInController get instance => Get.find();
  // final controller = Get.put(OAYSAuthenticationServices());

  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final isLoginSuccess = false.obs;
  // final isLoading = true.obs;

  Future<String>? login() async {
    if (emailAddress.text.isEmpty) {
      return 'Please enter your email address';
    } else if (password.text.isEmpty) {
      return 'Please enter your password';
    } else {
      isLoginSuccess.value = true;
      String? error =
          await OAYSAuthenticationServices.instance.oAYSCustomerLoginService(
        emailId: emailAddress.text.trim(),
        password: password.text.trim(),
      );
      if (error != 'Success') {
        return error.toString();
      } else {
        return 'Logged-in successfully';
      }
    }
  }
}
