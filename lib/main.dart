import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/UIs/screens/Registration/NameInputScreen.dart';
import 'package:main/UIs/screens/Welcome/welcome.dart';
import 'package:main/UIs/screens/Welcome/welcome_screen_2.dart';
import 'package:main/UIs/screens/Welcome/welcome_screen_3.dart';
import 'UIs/screens/Welcome/welcome_screen_1.dart';


// Main function
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Welcome(),
    );
  }
  
}