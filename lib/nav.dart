import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'homepage.dart';
import 'contact_us.dart';
import 'Webview.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0;
  final screens = [
    HomePage(),
    ContactsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.grey.shade300,
          labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.grey.shade100,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.contact_support_sharp),
              label: 'Contact',
            ),
          ],
        ),
      ),
    );
  }
}
