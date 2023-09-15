import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/controllers/oays_authentication_repositary.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSSignInController extends GetxController {
  static OAYSSignInController get instance => Get.find();
  // final controller = Get.put(OAYSAuthenticationServices());

  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final isLoginSuccess = false.obs;
  final isLoading = true.obs;

  // var isEmailAddressEmpty = true.obs;
  // var isPasswordEmpty = true.obs;

  // isEmailEmptyValidation(String emailAddress) {
  //   isEmailAddressEmpty.value = emailAddress.isEmpty;
  // }

  // isPasswordEmptyValidation(String password) {
  //   isPasswordEmpty.value = password.isEmpty;
  // }

  // Future<void> login() async {
  //   if (emailAddress.text.isEmpty) {
  //     isLoginSuccess.value = false;
  //     Get.snackbar(
  //       "Info",
  //       'Please enter your email address',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: boxFillColor,
  //       colorText: Colors.black,
  //     );
  //   } else if (password.text.isEmpty) {
  //     isLoginSuccess.value = false;
  //     Get.snackbar(
  //       "Info",
  //       'Please enter your password',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: boxFillColor,
  //       colorText: Colors.black,
  //     );
  //   } else {
  //     isLoading.value = false;
  //     String? error =
  //         await OAYSAuthenticationServices.instance.oAYSCustomerLoginService(
  //       emailId: emailAddress.text.trim(),
  //       password: password.text.trim(),
  //     );
  //     if (error != 'Success') {
  //       isLoginSuccess.value = false;
  //       isLoading.value = true;
  //       Get.snackbar(
  //         "Info",
  //         error.toString(),
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: boxFillColor,
  //         colorText: Colors.black,
  //       );
  //     } else {
  //       isLoginSuccess.value = true;
  //       isLoading.value = true;
  //       Get.snackbar(
  //         "Info",
  //         'Logged-in successfully',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: boxFillColor,
  //         colorText: Colors.black,
  //       );
  //     }
  //   }
  // }

  Future<String>? login() async {
    if (emailAddress.text.isEmpty) {
      isLoginSuccess.value = false;
      // Get.snackbar(
      //   "Info",
      //   'Please enter your email address',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: boxFillColor,
      //   colorText: Colors.black,
      // );
      return 'Please enter your email address';
    } else if (password.text.isEmpty) {
      // isLoginSuccess.value = false;
      // Get.snackbar(
      //   "Info",
      //   'Please enter your password',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: boxFillColor,
      //   colorText: Colors.black,
      // );
      return 'Please enter your password';
    } else {
      isLoginSuccess.value = true;
      String? error =
          await OAYSAuthenticationServices.instance.oAYSCustomerLoginService(
        emailId: emailAddress.text.trim(),
        password: password.text.trim(),
      );
      if (error != 'Success') {
        // isLoginSuccess.value = false;
        // isLoading.value = true;
        // Get.snackbar(
        //   "Info",
        //   error.toString(),
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: boxFillColor,
        //   colorText: Colors.black,
        // );
        return error.toString();
      } else {
        // isLoginSuccess.value = true;
        // isLoading.value = true;
        // Get.snackbar(
        //   "Info",
        //   'Logged-in successfully',
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: boxFillColor,
        //   colorText: Colors.black,
        // );
        return 'Logged-in successfully';
      }
    }
  }
}
