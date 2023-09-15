import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:oays/models/customer_registration.dart';
import 'package:oays/screens/oays_home_screen.dart';
import 'package:oays/screens/oays_signin_screen.dart';
import 'package:oays/services/database_services.dart';

class OAYSAuthenticationServices extends GetxController {
  static OAYSAuthenticationServices get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  Rx<User?> _firebaseUser = Rx<User?>(null);
  String? get user => _firebaseUser.value?.email;
  var status;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<String?> oAYSCustomerRegistrationService(
      String emaillId, String password, CustomerRegistration cr) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: emaillId, password: password)
          .then((value) async {
        status = await DatabaseService().addCustomer(cReg: cr);
        // print(status);
      });

      return status;
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
              () => const OAYSHomeScreen(),
            ),
          );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email. Please sign up';
      } else if (e.code == 'wrong-password') {
        return 'Invalid password';
      } else {
        return e.message.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> logout() async {
    await _auth.signOut().then(
          (value) => Get.offAll(
            () => const OAYSSignInScreen(),
          ),
        );
  }
}
