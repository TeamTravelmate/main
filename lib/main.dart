import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:main/UIs/widgets/side_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Image(image: ),
        nextScreen: nextScreen,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
