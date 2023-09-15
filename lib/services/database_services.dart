import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:oays/controllers/oays_databaseservice_controller.dart';
import 'package:oays/models/customer_registration.dart';
import 'package:oays/models/offer_product_model.dart';

class DatabaseService {
  final controller = Get.put(DatabaseServiceController());
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
        controller.isLoading.value = false;
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

  Future<String> addOfferProduct({required OfferProduct op}) async {
    try {
      String productSubCollectionId;
      await _db
          .collection('ProductDetail')
          .doc(userId)
          .set(Map.of({'_id': userId}))
          .whenComplete(() async {
        productSubCollectionId = _db
            .collection('ProductDetail')
            .doc(userId)
            .collection('OfferProductDetail')
            .doc()
            .id;
        _db
            .collection('ProductDetail')
            .doc(userId)
            .collection('OfferProductDetail')
            .doc(productSubCollectionId)
            .set(op.toMap())
            .whenComplete(() {
          _db
              .collection('ProductDetail')
              .doc(userId)
              .collection('OfferProductDetail')
              .doc(productSubCollectionId)
              .update(timeTracker);
          _db
              .collection('ProductDetail')
              .doc(userId)
              .collection('OfferProductDetail')
              .doc(productSubCollectionId)
              .update(
                Map.of(
                  {'offerProductId': productSubCollectionId},
                ),
              );
          // Get.offAll(() => const OAYSSignInScreen());
        });
      });
      return 'Success';
    } on FirebaseException catch (e) {
      return e.message.toString();
    } catch (e) {
      return 'Unable to add product now. Please try again later.';
    }
  }
}
