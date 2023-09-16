import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:oays/services/database_services.dart';

class OAYSMerchantViewOfferController extends GetxController {
  static OAYSMerchantViewOfferController get instance => Get.find();

  FirebaseFirestore db = DatabaseService().getDBInstance();
  // var getOfferProductList = db;
}
