import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/UIs/screens/friendList/friend_list.dart';
import 'package:main/UIs/screens/registration/name_reg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
      ),
      //remove debug banner
      debugShowCheckedModeBanner: false,
      home: nameReg(),
    );
  }
}
