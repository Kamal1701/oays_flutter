import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/components/oays_sigin_buttons.dart';
import 'package:oays/components/oays_textfields.dart';
import 'package:oays/controllers/oays_signin_screen_controller.dart';
import 'package:oays/screens/oays_forgot_password_screen.dart';
import 'package:oays/screens/oays_merchant_signup_screen.dart';
import 'package:oays/screens/oays_signup_screen.dart';
import 'package:oays/utils/helpers/color_constant.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSSignInScreen extends StatefulWidget {
  const OAYSSignInScreen({super.key});

  @override
  State<OAYSSignInScreen> createState() => _OAYSSignInScreenState();
}

// ignore: camel_case_types
class _OAYSSignInScreenState extends State<OAYSSignInScreen> {
  final controller = Get.put(OAYSSignInController());
  Future<dynamic>? getStatus;

  Future userSignIn() async {
    controller.isEmailEmptyValidation(controller.emailAddress.text);
    controller.isPasswordEmptyValidation(controller.password.text);
    controller.login();
  }

  void _onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OAYSForgotPasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                // logoWidget("assets/images/oays.webp"),
                addVerticalSpace(30),
                OAYSCustomTextField(
                  controller: controller.emailAddress,
                  hintText: "user email",
                  obscureText: false,
                ),
                addVerticalSpace(10),
                OAYSCustomTextField(
                  controller: controller.password,
                  hintText: "password",
                  obscureText: true,
                ),
                // addVerticalSpace(0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _onButtonPressed,
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(20),
                OAYSCustomElevatedButtons(
                  buttonText: "Sign In",
                  onTap: () async {
                    userSignIn();
                  },
                ),
                addVerticalSpace(20),
                signUpOption(),
                addVerticalSpace(250),
                signUpAsMerchantOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account? ",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OAYSCustomerSignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Row signUpAsMerchantOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Want to catch more customers? ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OAYSMerchantSignUpScreen()));
              },
              child: const Text(
                "Sign Up As Merchant",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
