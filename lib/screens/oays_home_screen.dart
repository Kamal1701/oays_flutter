import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oays/controllers/oays_home_screen_controller.dart';
import 'package:oays/models/customer_registration.dart';
import 'package:oays/services/database_services.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSHomeScreen extends StatefulWidget {
  const OAYSHomeScreen({super.key});

  @override
  State<OAYSHomeScreen> createState() => _OAYSHomeScreenState();
}

class _OAYSHomeScreenState extends State<OAYSHomeScreen> {
  final drawerController = Get.put(OAYSHomeScreenController());

  @override
  void initState() {
    super.initState();
    setState(() {
      drawerController.setSelectedMenuIndex(0);
    });
  }

  void _onItemTapped(int index) {
    setState(
      () {
        drawerController.setSelectedMenuIndex(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drawerController.pageTitle),
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
