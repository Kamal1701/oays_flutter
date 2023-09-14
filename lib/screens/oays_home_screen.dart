import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/controllers/oays_home_screen_controller.dart';
import 'package:oays/models/customer_registration.dart';
import 'package:oays/providers/user_data_provider.dart';
import 'package:oays/screens/oays_add_offer_screen.dart';
import 'package:oays/screens/oays_all_offers_screen.dart';
import 'package:oays/screens/oays_customer_profile_screen.dart';
import 'package:oays/screens/oays_merchant_view_offer_screen.dart';
import 'package:oays/screens/oays_offer_near_me_screen.dart';
import 'package:oays/services/database_services.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSHomeScreen extends StatefulWidget {
  const OAYSHomeScreen({super.key});

  @override
  State<OAYSHomeScreen> createState() => _OAYSHomeScreenState();
}

class _OAYSHomeScreenState extends State<OAYSHomeScreen> {
  final drawerController = Get.put(OAYSHomeScreenController());
  var currentPage = DrawerOptions.offersNearme;
  String _pageTitle = "Offer Near Me";
  // int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        // _selectedIndex = index;
        drawerController.setSelectedMenuIndex(index);
        _pageTitle = drawerController.pageTitle;
        // currentPage = drawerController.currentPage;
        // if (index == 0) {
        //   currentPage = DrawerOptions.offersNearme;
        // } else if (index == 1) {
        //   currentPage = DrawerOptions.allOffers;
        // } else if (index == 2) {
        //   currentPage = DrawerOptions.profile;
        // } else if (index == 3) {
        //   currentPage = DrawerOptions.addOffer;
        // } else if (index == 4) {
        //   currentPage = DrawerOptions.editOffer;
        // }
        // if (drawerController.selectedIndex.value == 0) {
        //   currentPage = DrawerOptions.offersNearme;
        // } else if (drawerController.selectedIndex.value == 1) {
        //   currentPage = DrawerOptions.allOffers;
        // } else if (drawerController.selectedIndex.value == 2) {
        //   currentPage = DrawerOptions.profile;
        // } else if (drawerController.selectedIndex.value == 3) {
        //   currentPage = DrawerOptions.addOffer;
        // } else if (drawerController.selectedIndex.value == 4) {
        //   currentPage = DrawerOptions.editOffer;
        // }
        // print(currentPage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // var container;

    // if (currentPage == DrawerOptions.offersNearme) {
    //   _pageTitle = "Offer Near Me";
    //   container = const OAYSOffersNearMeScreen();
    // } else if (currentPage == DrawerOptions.allOffers) {
    //   _pageTitle = "All Offer";
    //   container = const OAYSAllOfferScreen();
    // } else if (currentPage == DrawerOptions.profile) {
    //   _pageTitle = "Profile";
    //   container = const OAYSCustomerProfileScreen();
    // } else if (currentPage == DrawerOptions.addOffer) {
    //   _pageTitle = "Add Offers";
    //   container = const OAYSAddOfferScreen();
    // } else if (currentPage == DrawerOptions.editOffer) {
    //   _pageTitle = "Edit Offer";
    //   container = const OAYSMerchantViewOfferScreen();
    // }
    // if (currentPage == DrawerOptions.offersNearme) {
    //   _pageTitle = "Offer Near Me";
    //   container = const OAYSOffersNearMeScreen();
    // } else if (currentPage == DrawerOptions.allOffers) {
    //   _pageTitle = "All Offer";
    //   container = const OAYSAllOfferScreen();
    // } else if (currentPage == DrawerOptions.profile) {
    //   _pageTitle = "Profile";
    //   container = const OAYSCustomerProfileScreen();
    // } else if (currentPage == DrawerOptions.addOffer) {
    //   _pageTitle = "Add Offers";
    //   container = const OAYSAddOfferScreen();
    // } else if (currentPage == DrawerOptions.editOffer) {
    //   _pageTitle = "Edit Offer";
    //   container = const OAYSMerchantViewOfferScreen();
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle),
        backgroundColor: bgdDarkColor,
      ),
      body: drawerController.container,
      drawer: Drawer(
        elevation: 0,
        backgroundColor: boxFillColor,
        width: 250,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            FutureBuilder<CustomerRegistration?>(
              future: DatabaseService().getCustomer(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final CustomerRegistration cr = snapshot.data!;
                  return DrawerHeader(
                    decoration: BoxDecoration(
                      color: bgdDarkColor,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              cr.userName,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              cr.userLocation,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return DrawerHeader(
                    decoration: BoxDecoration(
                      color: bgdDarkColor,
                    ),
                    child: const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Guest User',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Unknown Location',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            oAYSDrawerList(),
          ],
        ),
      ),
    );
  }

  Widget oAYSDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      color: bgdDarkColor,
      child: Column(
        children: [
          oAYSMenuOption(
            0,
            "Offers Near Me",
          ),
          oAYSMenuOption(
            1,
            "All Offers",
          ),
          oAYSMenuOption(
            2,
            "Profile",
          ),
          oAYSMenuOption(
            3,
            "Add Offer",
          ),
          oAYSMenuOption(
            4,
            "Edit Offer",
          ),
        ],
      ),
    );
  }

  Widget oAYSMenuOption(int id, String title) {
    return Material(
      color: boxFillColor,
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        selected: drawerController.selectedIndex.value == id,
        onTap: () {
          Navigator.pop(context);
          _onItemTapped(id);
        },
      ),
    );
  }
}

enum DrawerOptions { offersNearme, allOffers, profile, addOffer, editOffer }
