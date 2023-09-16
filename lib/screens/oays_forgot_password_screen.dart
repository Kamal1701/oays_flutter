import 'package:flutter/material.dart';
import 'package:oays/screens/oays_signin_screen.dart';
import 'package:oays/utils/helpers/color_constant.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSForgotPasswordScreen extends StatefulWidget {
  const OAYSForgotPasswordScreen({super.key});

  @override
  State<OAYSForgotPasswordScreen> createState() =>
      _OAYSForgotPasswordScreenState();
}

class _OAYSForgotPasswordScreenState extends State<OAYSForgotPasswordScreen> {
  final _emaildIdforgotTextController = TextEditingController();

  void _onResetBtnPressed() {}

  void _onCancelBtnPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OAYSSignInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(50),
                const Text(
                  "Reset Login Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                addVerticalSpace(20),
                TextField(
                  controller: _emaildIdforgotTextController,
                  obscureText: false,
                  decoration: InputDecoration(
                      // hintText: "email address",
                      labelText: "Email Address",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: hintTextColor,
                      )),
                ),
                // OAYS_TextField(
                //   controller: _emaildIdforgotTextController,
                //   hintText: "email address",
                //   obscureText: false,
                // ),
                addVerticalSpace(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _onResetBtnPressed,
                      child: const Text("Reset"),
                    ),
                    addHorizontalSpace(20),
                    ElevatedButton(
                      onPressed: _onCancelBtnPressed,
                      child: const Text("Cancel"),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
