import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:oays/components/oays_sigin_buttons.dart';
import 'package:oays/components/oays_textfields.dart';
import 'package:oays/controllers/oays_merchant_signup_screen_controller.dart';
import 'package:oays/utils/helpers/color_constant.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSMerchantSignUpScreen extends StatefulWidget {
  const OAYSMerchantSignUpScreen({super.key});

  @override
  State<OAYSMerchantSignUpScreen> createState() =>
      _OAYSMerchantSignUpScreenState();
}

class _OAYSMerchantSignUpScreenState extends State<OAYSMerchantSignUpScreen> {
  final controller = Get.put(OAYSMerchantSignUpController());

  @override
  void initState() {
    super.initState();
    controller.clearScreen();
  }

  void merchantSignUp() {
    setState(() {
      controller.isMerchantRegisterSuccess.value = true;
    });
    controller.createMerchant()?.then((value) {
      Get.snackbar('Info', value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: boxFillColor,
          colorText: Colors.black);
      setState(() {
        controller.isMerchantRegisterSuccess.value = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hexStringToColor("edd38c"),
                hexStringToColor("ebc86a"),
                hexStringToColor("e6b943")
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: <Widget>[
                  addVerticalSpace(50),
                  const Text(
                    "Merchant Registration",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                      controller: controller.userName,
                      hintText: "User Name",
                      obscureText: false),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                      controller: controller.emailAddress,
                      hintText: "Email ID",
                      obscureText: false),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                      controller: controller.password,
                      hintText: "Password",
                      obscureText: true),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                      controller: controller.location,
                      hintText: "Your Location",
                      obscureText: false),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                      controller: controller.shopName,
                      hintText: "Shop Name",
                      obscureText: false),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                      controller: controller.shopStreetName,
                      hintText: "Street Name",
                      obscureText: false),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                      controller: controller.shopCity,
                      hintText: "Shop's City",
                      obscureText: false),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                      controller: controller.shopState,
                      hintText: "Shop's State",
                      obscureText: false),
                  addVerticalSpace(15),
                  OAYSCustomTextField(
                      controller: controller.shopPincode,
                      hintText: "Shop's Pincode",
                      obscureText: false),
                  addVerticalSpace(30),
                  OAYSCustomElevatedButtons(
                    buttonText: "Sign Up",
                    onTap: merchantSignUp,
                  ),
                  addVerticalSpace(50),
                ],
              ),
            ),
          ),
        ),
      ),
      if (controller.isMerchantRegisterSuccess.value)
        const Opacity(
          opacity: 0.5,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
      if (controller.isMerchantRegisterSuccess.value)
        const Center(
          child: CircularProgressIndicator(),
        ),
    ]);
  }
}
