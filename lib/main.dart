import 'package:flutter/material.dart';

import 'UIs/screens/Welcome/welcome_screen_1.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeScreenOne(),
    );
  }
  
}