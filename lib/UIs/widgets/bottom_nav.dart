import 'package:flutter/material.dart';
import 'package:main/UIs/screens/Chat/chat_page.dart';
import 'package:main/UIs/screens/Marketplace/marketplace_page.dart';
import 'package:main/UIs/screens/Search/search_page.dart';
import 'package:main/UIs/screens/Trip%20Planning/trip_planning.dart';
import 'package:main/UIs/screens/home/home_page.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages = [
    const HomePage(),
    const SearchPage(),
    const TripPlanningPage(),
    const MarketplacePage(),
    const ChatPage(),
  ];

  int currIndex = 0;

  void onTap(int index) {
    setState(() {
      currIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.blueGrey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: currIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Trip planning",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined ),
            label: "Marketplace",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_outlined),
            label: "Chat",
          ),
        ],
      )
    );
  }
}
