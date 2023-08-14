import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/UIs/screens/Trip/customizeDestination_page.dart';
import 'package:main/UIs/screens/Trip/customizeResturants_page.dart';
import 'UIs/screens/map/map_todo.dart';

// Main function
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CustomizeResturants(),
    );
  }
}

