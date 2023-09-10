import 'package:flutter/material.dart';
import 'package:oays/components/oays_sigin_buttons.dart';
import 'package:oays/components/oays_textfields.dart';
import 'package:oays/screens/oays_forgot_password_screen.dart';
import 'package:oays/screens/oays_home_screen.dart';
import 'package:oays/screens/oays_merchant_signup_screen.dart';
import 'package:oays/screens/oays_signup_screen.dart';
import 'package:oays/services/auth_services.dart';
import 'package:oays/services/database_services.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSSignInScreen extends StatefulWidget {
  const OAYSSignInScreen({super.key});

  @override
  State<OAYSSignInScreen> createState() => _OAYSSignInScreenState();
}

// ignore: camel_case_types
class _OAYSSignInScreenState extends State<OAYSSignInScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  Future<dynamic>? getStatus;

  Future userSignIn() async {
    print("user clicked signup button");
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      final message = await AuthServices().oAYSLoginService(
        emailId: _emailTextController.text,
        password: _passwordTextController.text,
      );
      if (message.toString().contains('Success')) {
        final getCustomerStatus = await DatabaseService().getCustomer();
        return getCustomerStatus;
      }
      if (!message.toString().contains('Success') && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message.toString()),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your login credential..'),
        ),
      );
    }
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
                  controller: _emailTextController,
                  hintText: "user email",
                  obscureText: false,
                ),
                addVerticalSpace(10),
                OAYSCustomTextField(
                  controller: _passwordTextController,
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
                    getStatus = userSignIn();
                    // if (getStatus.toString().contains('Success')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OAYSHomeScreen(),
                      ),
                    );
                    // }
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
