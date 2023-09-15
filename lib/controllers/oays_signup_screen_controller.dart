import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/controllers/oays_authentication_repositary.dart';
import 'package:oays/models/customer_registration.dart';
import 'package:oays/screens/oays_signin_screen.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSSignUpController extends GetxController {
  static OAYSSignUpController get instance => Get.find();

  final isRegisterSuccess = false.obs;

  final userName = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final location = TextEditingController();

  final isUserNameEmpty = true.obs;
  final isEmailAddressEmpty = true.obs;
  final isPasswordEmpty = true.obs;
  final isLocation = true.obs;

  // final isSuccess = false.obs;

  Future<String>? createUser() async {
    if (userName.text.isEmpty &&
        emailAddress.text.isEmpty &&
        password.text.isEmpty &&
        location.text.isEmpty) {
      return 'Please enter requested information.';
    } else if (userName.text.isEmpty) {
      return 'Please enter your username.';
    } else if (emailAddress.text.isEmpty) {
      return 'Please enter your email address.';
    } else if (password.text.isEmpty) {
      return 'Please enter password.';
    } else if (location.text.isEmpty) {
      return 'Please enter your location or city.';
    } else {
      isRegisterSuccess.value = true;
      CustomerRegistration custReg = CustomerRegistration(
          userName.text.toString(),
          location.text.toString(),
          false,
          '',
          '',
          '',
          '',
          '');
      String? error = await OAYSAuthenticationServices.instance
          .oAYSCustomerRegistrationService(
              emailAddress.text.trim(), password.text.trim(), custReg);
      if (error != 'Success') {
        return error.toString();
      } else {
        clearScreen();
        Get.offAll(() => const OAYSSignInScreen());
        return 'User created successfully...';
      }
    }
  }

  Future<void> clearScreen() async {
    userName.text = '';
    emailAddress.text = '';
    password.text = '';
    location.text = '';
  }
}
