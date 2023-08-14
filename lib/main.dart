import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/UIs/screens/Ad%20Mate/ad_mate.dart';
import 'package:main/UIs/screens/Ad%20Mate/ad_mate_res.dart';
import 'package:main/UIs/screens/Registration/NameInputScreen.dart';
import 'package:main/UIs/screens/Welcome/welcome.dart';
import 'package:main/UIs/screens/Welcome/welcome_screen_2.dart';
import 'package:main/UIs/screens/Welcome/welcome_screen_3.dart';
import 'package:main/UIs/screens/addCard/address.dart';
import 'package:main/UIs/screens/leaderboard/leaderboard.dart';
import 'package:main/UIs/screens/login/login_page.dart';
import 'package:main/UIs/screens/myorders/orders_1.dart';
import 'package:main/UIs/screens/emergency_support/emergency_support_home.dart';
import 'package:main/UIs/screens/login/login_page.dart';
import 'package:main/UIs/screens/vendor/home_page.dart';
import 'package:main/UIs/widgets/bottom_nav.dart';
import 'package:main/UIs/screens/profile/profile.dart';
import 'UIs/screens/Trip/publicTripViewPage.dart';
import 'UIs/screens/Trip/tripView_page.dart';
import 'UIs/screens/Welcome/welcome_screen_1.dart';

// Main function
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));

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
      home: HomePage(),
    );
  }
}
