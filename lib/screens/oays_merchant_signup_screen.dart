import 'package:flutter/material.dart';
import 'package:oays/components/oays_sigin_buttons.dart';
import 'package:oays/components/oays_textfields.dart';
import 'package:oays/screens/oays_signin_screen.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSMerchantSignUpScreen extends StatefulWidget {
  const OAYSMerchantSignUpScreen({super.key});

  @override
  State<OAYSMerchantSignUpScreen> createState() =>
      _OAYSMerchantSignUpScreenState();
}

class _OAYSMerchantSignUpScreenState extends State<OAYSMerchantSignUpScreen> {
  final _userNameTextController = TextEditingController();
  final _emailIdTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _locationTextController = TextEditingController();
  final _shopNameTextController = TextEditingController();
  final _shopStreetTextController = TextEditingController();
  final _shopCityTextController = TextEditingController();
  final _shopStateTextController = TextEditingController();
  final _shopPincodeTextController = TextEditingController();

  void merchantSignUp() {
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
                    controller: _userNameTextController,
                    hintText: "user name",
                    obscureText: false),
                addVerticalSpace(15),
                OAYSCustomTextField(
                    controller: _emailIdTextController,
                    hintText: "email address",
                    obscureText: false),
                addVerticalSpace(15),
                OAYSCustomTextField(
                    controller: _passwordTextController,
                    hintText: "password",
                    obscureText: true),
                addVerticalSpace(15),
                OAYSCustomTextField(
                    controller: _locationTextController,
                    hintText: "location",
                    obscureText: false),
                addVerticalSpace(15),
                OAYSCustomTextField(
                    controller: _shopNameTextController,
                    hintText: "shop name",
                    obscureText: false),
                addVerticalSpace(15),
                OAYSCustomTextField(
                    controller: _shopStreetTextController,
                    hintText: "street name",
                    obscureText: false),
                addVerticalSpace(15),
                OAYSCustomTextField(
                    controller: _shopCityTextController,
                    hintText: "city name",
                    obscureText: false),
                addVerticalSpace(15),
                OAYSCustomTextField(
                    controller: _shopStateTextController,
                    hintText: "state",
                    obscureText: false),
                addVerticalSpace(15),
                OAYSCustomTextField(
                    controller: _shopPincodeTextController,
                    hintText: "pincode",
                    obscureText: false),
                addVerticalSpace(30),
                OAYSCustomElevatedButtons(
                    buttonText: "Sign Up", onTap: merchantSignUp),
                addVerticalSpace(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
