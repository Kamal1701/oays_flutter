import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
import 'package:oays/models/customer_registration.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  String status = '';
  Map<String, dynamic> timeTracker = {
    'createdDate': FieldValue.serverTimestamp(),
    'updatedDate': FieldValue.serverTimestamp()
  };

  Future<String?> addCustomer({required CustomerRegistration cReg}) async {
    try {
      CollectionReference collectRef = _db.collection("CustomerProfile");
      await collectRef.doc(userId).set(cReg.toMap()).whenComplete(() {
        collectRef.doc(userId).update(timeTracker);
        // Get.offAll(() => const OAYSSignInScreen());
      });
      return 'Success'.toString();
    } on FirebaseException catch (e) {
      return e.message;
    } catch (e) {
      return 'Error in add customer';
    }
  }

  Future<CustomerRegistration?> getCustomer() async {
    try {
      DocumentSnapshot snapshot =
          await _db.collection("CustomerProfile").doc(userId).get();
      if (snapshot.exists) {
        final Map<String, dynamic> data =
            snapshot.data() as Map<String, dynamic>;
        return CustomerRegistration.fromMap(data);
      }
    } catch (e) {
      //
    }
    return null;
    // return CustomerRegistration.fromMap(
    //     snapshot.data() as Map<String, dynamic>);
  }

  // Future<DocumentSnapshot?> getCustomer() async {
  //   try {
  //     DocumentSnapshot snapshot =
  //         await _db.collection("CustomerProfile").doc(userId).get();
  //     if (snapshot.exists) {
  //       // final Map<String, dynamic> data =
  //       //     snapshot.data() as Map<String, dynamic>;
  //       return snapshot;
  //     }
  //   } catch (e) {
  //     //
  //   }
  //   return null;
  //   // return CustomerRegistration.fromMap(
  //   //     snapshot.data() as Map<String, dynamic>);
  // }
}
