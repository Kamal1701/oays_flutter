import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/controllers/oays_authentication_repositary.dart';
import 'package:oays/models/customer_registration.dart';
import 'package:oays/screens/oays_signin_screen.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSMerchantSignUpController extends GetxController {
  static OAYSMerchantSignUpController get instance => Get.find();

  final isMerchantRegisterSuccess = false.obs;

  final userName = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final location = TextEditingController();
  final shopName = TextEditingController();
  final shopStreetName = TextEditingController();
  final shopCity = TextEditingController();
  final shopState = TextEditingController();
  final shopPincode = TextEditingController();

  // final isUserNameBlankEmpty = true.obs;
  // final isEmailAddressEmpty = true.obs;
  // final isPasswordEmpty = true.obs;
  // final isLocationEmpty = true.obs;
  // final isShopNameEmpty = true.obs;
  // final isShopStreetNameEmpty = true.obs;
  // final isShopCityEmpty = true.obs;
  // final isShopStateEmpty = true.obs;
  // final isShopPincode = true.obs;

  Future<String>? createMerchant() async {
    if (userName.text.isEmpty ||
        emailAddress.text.isEmpty ||
        password.text.isEmpty ||
        location.text.isEmpty ||
        shopName.text.isEmpty ||
        shopStreetName.text.isEmpty ||
        shopCity.text.isEmpty ||
        shopState.text.isEmpty ||
        shopPincode.text.isEmpty) {
      // Get.snackbar(
      //   'Info',
      //   'Please enter requested details.',
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: boxFillColor,
      //   colorText: Colors.black,
      // );
      return 'Please enter requested details.';
    } else {
      isMerchantRegisterSuccess.value = true;
      CustomerRegistration custReg = CustomerRegistration(
          userName.text.toString(),
          location.text.toString(),
          true,
          shopName.text.toString(),
          shopStreetName.text.toString(),
          shopCity.text.toString(),
          shopState.text.toString(),
          shopPincode.text.toString());
      String? error = await OAYSAuthenticationServices.instance
          .oAYSCustomerRegistrationService(
              emailAddress.text.trim(), password.text.trim(), custReg);
      if (error != 'Success') {
        // Get.snackbar(
        //   'Info',
        //   error.toString(),
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: boxFillColor,
        //   colorText: Colors.black,
        // );
        return error.toString();
      } else {
        clearScreen();
        Get.offAll(() => const OAYSSignInScreen());
        return 'Merchant User created successfully...';
      }
    }
  }

  Future<void> clearScreen() async {
    userName.text = '';
    emailAddress.text = '';
    password.text = '';
    location.text = '';
    shopName.text = '';
    shopStreetName.text = '';
    shopCity.text = '';
    shopState.text = '';
    shopPincode.text = '';
  }
}
