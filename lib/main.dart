import 'package:flutter/material.dart';
import 'UIs/screens/home/home_page.dart';
import 'UIs/screens/search/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //remove debug banner
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}