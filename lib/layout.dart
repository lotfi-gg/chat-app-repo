import 'package:chat_app/screens/home/chat_home_screen.dart';
import 'package:chat_app/screens/home/contact_home_screen.dart';
import 'package:chat_app/screens/home/group_home_screen.dart';
import 'package:chat_app/screens/home/settings_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class layoutApp extends StatefulWidget {
  const layoutApp({super.key});

  @override
  State<layoutApp> createState() => _layoutAppState();
}

class _layoutAppState extends State<layoutApp> {
  PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [];
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        children: [
          ChatHomeScreen(),
          GroupHomeScreen(),
          ContactHomeScreen(),
          SettingsHomeScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
            pageController.jumpToPage(value);
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.message), label: 'messages'),
          NavigationDestination(icon: Icon(Iconsax.messages), label: 'groups'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'contacts'),
          NavigationDestination(icon: Icon(Iconsax.setting), label: 'settings'),
        ],
      ),
    );
  }
}
