import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/controllers/oays_authentication_repositary.dart';
import 'package:oays/models/customer_registration.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSSignUpController extends GetxController {
  static OAYSSignUpController get instance => Get.find();
  final controller = Get.put(OAYSAuthenticationServices());

  final userName = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final location = TextEditingController();

  final isUserNameEmpty = true.obs;
  final isEmailAddressEmpty = true.obs;
  final isPasswordEmpty = true.obs;
  final isLocation = true.obs;

  isUserNameEmptyValidation(String userName) {
    isUserNameEmpty.value = userName.isEmpty;
  }

  isEmailAddressEmptyValidation(String emailId) {
    isEmailAddressEmpty.value = emailId.isEmpty;
  }

  isPasswordValidation(String password) {
    isPasswordEmpty.value = password.isEmpty;
  }

  isLocationValidation(String loc) {
    isLocation.value = loc.isEmpty;
  }

  Future<void> createUser() async {
    // if (isUserNameEmpty.value ||
    //     isEmailAddressEmpty.value ||
    //     isPasswordEmpty.value ||
    //     isLocation.value) {
    if (userName.text.isEmpty &&
        emailAddress.text.isEmpty &&
        password.text.isEmpty &&
        location.text.isEmpty) {
      Get.snackbar(
        'Info',
        'Please enter requested information.',
        backgroundColor: boxFillColor,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (userName.text.isEmpty) {
      Get.snackbar(
        'Info',
        'Please enter your username.',
        backgroundColor: boxFillColor,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (emailAddress.text.isEmpty) {
      Get.snackbar(
        'Info',
        'Please enter your email address.',
        backgroundColor: boxFillColor,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (password.text.isEmpty) {
      Get.snackbar(
        'Info',
        'Please enter password.',
        backgroundColor: boxFillColor,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else if (location.text.isEmpty) {
      Get.snackbar(
        'Info',
        'Please enter your location or city.',
        backgroundColor: boxFillColor,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      CustomerRegistration custReg = CustomerRegistration(
          userName.text.toString(),
          location.text.toString(),
          false,
          '',
          '',
          '',
          '',
          '');
      String? error = await controller.oAYSCustomerRegistrationService(
          emailAddress.text.trim(), password.text.trim(), custReg);
      if (error != null) {
        Get.snackbar(
          'Info',
          error,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: boxFillColor,
          colorText: Colors.black,
        );
      }
    }
  }
}
