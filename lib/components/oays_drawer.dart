import 'package:flutter/material.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class OAYSCustomDrawer extends StatefulWidget {
  const OAYSCustomDrawer({super.key});

  @override
  State<OAYSCustomDrawer> createState() => _OAYSCustomDrawerState();
}

class _OAYSCustomDrawerState extends State<OAYSCustomDrawer> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: boxFillColor,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          DrawerHeader(
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
                      "kamal",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "kamal@abc.com",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              "Offers Near Me",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            selected: _selectedIndex == 0,
            onTap: () {
              _onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.disc_full),
            title: const Text(
              "All Offers",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            selected: _selectedIndex == 1,
            onTap: () {
              _onItemTapped(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            selected: _selectedIndex == 2,
            onTap: () {
              _onItemTapped(2);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
