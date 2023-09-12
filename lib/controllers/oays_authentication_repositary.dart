import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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
      await _auth.signInWithEmailAndPassword(
          email: emailId, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email. Please sign up';
      } else if (e.code == 'wrong-password') {
        return 'Invalid password';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
