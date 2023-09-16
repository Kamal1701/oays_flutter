import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/components/oays_sigin_buttons.dart';
import 'package:oays/components/oays_textfields.dart';
import 'package:oays/controllers/oays_databaseservice_controller.dart';
import 'package:oays/controllers/oays_signup_screen_controller.dart';
import 'package:oays/models/customer_registration.dart';
import 'package:oays/screens/oays_signin_screen.dart';
import 'package:oays/services/auth_services.dart';
import 'package:oays/services/database_services.dart';
import 'package:oays/utils/helpers/color_constant.dart';
import 'package:oays/utils/helpers/color_utils.dart';
import 'package:oays/utils/helpers/helper_widgets.dart';

class OAYSCustomerSignUpScreen extends StatefulWidget {
  const OAYSCustomerSignUpScreen({super.key});

  @override
  State<OAYSCustomerSignUpScreen> createState() =>
      _OAYSCustomerSignUpScreenState();
}

class _OAYSCustomerSignUpScreenState extends State<OAYSCustomerSignUpScreen> {
  final controller = Get.put(OAYSSignUpController());

  @override
  void initState() {
    super.initState();
    controller.clearScreen();
  }

  Future<void> userSignUp() async {
    controller.createUser()?.then((value) {
      setState(() {
        Get.snackbar('Info', value,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.black,
            backgroundColor: boxFillColor);
        controller.isRegisterSuccess.value = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                      controller: controller.userName,
                      hintText: "User Name",
                      obscureText: false,
                    ),
                    addVerticalSpace(15),
                    OAYSCustomTextField(
                      controller: controller.emailAddress,
                      hintText: "Email ID",
                      obscureText: false,
                    ),
                    addVerticalSpace(15),
                    OAYSCustomTextField(
                      controller: controller.password,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    addVerticalSpace(15),
                    OAYSCustomTextField(
                      controller: controller.location,
                      hintText: "Your Location",
                      obscureText: false,
                    ),
                    addVerticalSpace(25),
                    OAYSCustomElevatedButtons(
                      buttonText: "Sign-Up",
                      onTap: () async {
                        setState(() {
                          controller.isRegisterSuccess.value =
                              controller.isRegisterSuccess.value ? true : false;
                        });
                        userSignUp();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (controller.isRegisterSuccess.value)
          const Opacity(
            opacity: 0.5,
            child: ModalBarrier(
              color: Colors.grey,
              dismissible: false,
            ),
          ),
        if (controller.isRegisterSuccess.value)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
