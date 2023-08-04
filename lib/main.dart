import 'package:flutter/material.dart';
import 'package:main/UIs/screens/friendList/friend_list.dart';
import 'package:main/UIs/screens/map/map_todo.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //remove debug banner
      debugShowCheckedModeBanner: false,
      home: MapToDoScreen(),
    );
  }
}