import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/screens/oays_home_screen.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSAuthenticationServices extends GetxController {
  static OAYSAuthenticationServices get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  Future<String?> oAYSCustomerRegistrationService(
      String emaillId, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: emaillId, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account is already exist';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> oAYSCustomerLoginService({
    required String emailId,
    required String password,
  }) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: emailId, password: password)
          .then(
            (value) => Get.offAll(
              const OAYSHomeScreen(),
            ),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Get.snackbar("Info", 'No user found for that email. Please sign up',
        //     snackPosition: SnackPosition.BOTTOM,
        //     colorText: Colors.black,
        //     backgroundColor: boxFillColor);
        return 'No user found for that email. Please sign up';
      } else if (e.code == 'wrong-password') {
        // Get.snackbar("Info", 'Invalid password',
        //     snackPosition: SnackPosition.BOTTOM,
        //     colorText: Colors.black,
        //     backgroundColor: boxFillColor);
        return 'Invalid password';
      } else {
        // Get.snackbar("Info", e.message.toString(),
        //     snackPosition: SnackPosition.BOTTOM,
        //     colorText: Colors.black,
        //     backgroundColor: boxFillColor);
        return e.message.toString();
      }
    } catch (e) {
      // Get.snackbar("Info", e.toString(),
      //     snackPosition: SnackPosition.BOTTOM,
      //     colorText: Colors.black,
      //     backgroundColor: boxFillColor);
      return e.toString();
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
