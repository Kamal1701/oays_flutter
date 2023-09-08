import 'package:flutter/material.dart';
import 'package:oays/components/oays_sigin_buttons.dart';
import 'package:oays/components/oays_textfields.dart';
import 'package:oays/screens/oays_signin_screen.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSCustomerSignUpScreen extends StatefulWidget {
  const OAYSCustomerSignUpScreen({super.key});

  @override
  State<OAYSCustomerSignUpScreen> createState() =>
      _OAYSCustomerSignUpScreenState();
}

class _OAYSCustomerSignUpScreenState extends State<OAYSCustomerSignUpScreen> {
  final _userNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _locationTextController = TextEditingController();

  void userSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OAYSSignInScreen(),
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
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                addVerticalSpace(30),
                const Text(
                  "Customer Registration",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                addVerticalSpace(30),
                OAYSCustomTextField(
                  controller: _userNameTextController,
                  hintText: "user name",
                  obscureText: false,
                ),
                addVerticalSpace(15),
                OAYSCustomTextField(
                  controller: _emailTextController,
                  hintText: "email id",
                  obscureText: false,
                ),
                addVerticalSpace(15),
                OAYSCustomTextField(
                  controller: _passwordTextController,
                  hintText: "password",
                  obscureText: true,
                ),
                addVerticalSpace(15),
                OAYSCustomTextField(
                  controller: _locationTextController,
                  hintText: "location",
                  obscureText: false,
                ),
                addVerticalSpace(25),
                OAYSCustomElevatedButtons(
                  buttonText: "Sign-Up",
                  onTap: userSignUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
