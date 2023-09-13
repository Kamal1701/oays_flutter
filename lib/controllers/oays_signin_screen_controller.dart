import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/controllers/oays_authentication_repositary.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSSignInController extends GetxController {
  static OAYSSignInController get instance => Get.find();
  final controller = Get.put(OAYSAuthenticationServices());

  final emailAddress = TextEditingController();
  final password = TextEditingController();

  var isEmailAddressEmpty = true.obs;
  var isPasswordEmpty = true.obs;

  isEmailEmptyValidation(String emailAddress) {
    isEmailAddressEmpty.value = emailAddress.isEmpty;
  }

  isPasswordEmptyValidation(String password) {
    isPasswordEmpty.value = password.isEmpty;
  }

  Future<void> login() async {
    if (emailAddress.text.isEmpty) {
      Get.snackbar(
        "Info",
        'Please enter your email address',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: boxFillColor,
        colorText: Colors.black,
      );
    } else if (password.text.isEmpty) {
      Get.snackbar(
        "Info",
        'Please enter your password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: boxFillColor,
        colorText: Colors.black,
      );
    } else {
      String? error = await controller.oAYSCustomerLoginService(
        emailId: emailAddress.text.trim(),
        password: password.text.trim(),
      );
      if (error != null) {
        Get.snackbar(
          "Info",
          error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: boxFillColor,
          colorText: Colors.black,
        );
      }
    }
  }
}
