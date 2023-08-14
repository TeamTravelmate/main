import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:main/UIs/screens/Marketplace/marketplace_page.dart';
import 'package:main/UIs/screens/Trip/tripPlanning_page.dart';
import 'package:main/UIs/screens/addCard/address.dart';
import 'package:main/UIs/screens/friendList/friend_list.dart';
import 'package:main/UIs/screens/home/home_page.dart';
import 'package:main/UIs/screens/leaderboard/leaderboard.dart';
import 'package:main/UIs/screens/myorders/orders_1.dart';
import 'package:main/UIs/screens/product/add.dart';
import 'package:main/UIs/screens/search/search_page.dart';
import 'package:main/UIs/screens/vendor/home_page.dart';
import 'package:main/UIs/widgets/side_drawer.dart';

class BottomNav extends StatefulWidget {
  final token;
  const BottomNav({@required this.token, super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages = [
    const home(),
    const SearchPlace(),
    trip(),
    HomePage(),
    const FriendsList(),
    Add(),
    Address(),
    LeaderBoard(),
    Deliver()
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
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Marketplace",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_outlined),
              label: "Chat",
            ),
          ],
        ));
  }
}
