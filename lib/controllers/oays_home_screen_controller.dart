import 'package:get/get.dart';
import 'package:oays/screens/oays_add_offer_screen.dart';
import 'package:oays/screens/oays_all_offers_screen.dart';
import 'package:oays/screens/oays_customer_profile_screen.dart';
import 'package:oays/screens/oays_merchant_view_offer_screen.dart';
import 'package:oays/screens/oays_offer_near_me_screen.dart';

enum DrawerOptions { offersNearme, allOffers, profile, addOffer, editOffer }

class OAYSHomeScreenController extends GetxController {
  static OAYSHomeScreenController get instance => Get.find();

  var container;
  var pageTitle = 'Offer Near Me';
  final selectedIndex = 0.obs;
  var currentPage = DrawerOptions.offersNearme;

  void setSelectedMenuIndex(int index) {
    selectedIndex.value = index;
    switch (selectedIndex.value) {
      case 0:
        currentPage = DrawerOptions.offersNearme;
        pageTitle = 'Offer Near Me';
        container = const OAYSOffersNearMeScreen();
      // print(currentPage);
      case 1:
        currentPage = DrawerOptions.allOffers;
        pageTitle = 'All Offers';
        container = const OAYSAllOfferScreen();
      // print(currentPage);
      case 2:
        currentPage = DrawerOptions.profile;
        pageTitle = 'Profile';
        container = const OAYSCustomerProfileScreen();
      // print(currentPage);
      case 3:
        currentPage = DrawerOptions.addOffer;
        pageTitle = 'Add Offer';
        container = const OAYSAddOfferScreen();
      // print(currentPage);
      case 4:
        currentPage = DrawerOptions.editOffer;
        pageTitle = 'Edit Offer';
        container = const OAYSMerchantViewOfferScreen();
      // print(currentPage);
    }
  }

  // void setPageTitle() {
  //   pageTitle.value = '';
  // }

  void getCurrentPage() {
    switch (selectedIndex.value) {
      case 0:
        currentPage = DrawerOptions.offersNearme;
      case 1:
        currentPage = DrawerOptions.allOffers;
      case 2:
        currentPage = DrawerOptions.profile;
      case 3:
        currentPage = DrawerOptions.addOffer;
      case 4:
        currentPage = DrawerOptions.editOffer;
    }
    // if (selectedIndex.value == 0) {
    //   currentPage = DrawerOptions.offersNearme;
    // } else if (selectedIndex.value == 1) {
    //   currentPage = DrawerOptions.allOffers;
    // } else if (selectedIndex.value == 2) {
    //   currentPage = DrawerOptions.profile;
    // } else if (selectedIndex.value == 3) {
    //   currentPage = DrawerOptions.addOffer;
    // } else if (selectedIndex.value == 4) {
    //   currentPage = DrawerOptions.editOffer;
    // }
  }
}
