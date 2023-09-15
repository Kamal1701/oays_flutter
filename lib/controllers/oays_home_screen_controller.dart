import 'package:get/get.dart';
import 'package:oays/screens/oays_add_offer_screen.dart';
import 'package:oays/screens/oays_all_offers_screen.dart';
import 'package:oays/screens/oays_customer_profile_screen.dart';
import 'package:oays/screens/oays_merchant_view_offer_screen.dart';
import 'package:oays/screens/oays_offer_near_me_screen.dart';

class OAYSHomeScreenController extends GetxController {
  static OAYSHomeScreenController get instance => Get.find();

  // ignore: prefer_typing_uninitialized_variables
  var container;
  var pageTitle = 'Offer Near Me';
  // final pageTitle = RxString('Offer Near Me');
  final selectedIndex = 0.obs;

  void setSelectedMenuIndex(int index) {
    selectedIndex.value = index;
    switch (selectedIndex.value) {
      case 0:
        pageTitle = 'Offer Near Me';
        container = const OAYSOffersNearMeScreen();
      case 1:
        pageTitle = 'All Offers';
        container = const OAYSAllOfferScreen();
      case 2:
        pageTitle = 'Profile';
        container = const OAYSCustomerProfileScreen();
      case 3:
        pageTitle = 'Add Offer';
        container = const OAYSAddOfferScreen();
      case 4:
        pageTitle = 'Edit Offer';
        container = const OAYSMerchantViewOfferScreen();
    }
  }
}
