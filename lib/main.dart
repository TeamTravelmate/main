import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:main/Domain/provider/register_form_provider.dart';
import 'package:main/UIs/screens/vendor/home_page.dart';
import 'package:main/UIs/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UIs/screens/Trip/publicTrip/publicTripViewPage.dart';
import 'UIs/screens/Trip/tripView_page.dart';
import 'UIs/screens/Welcome/welcome_screen_1.dart';
import 'UIs/screens/home/home_page.dart';
import 'UIs/screens/profile/myTrips.dart';

// Main function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));

  runApp(
    MyApp(
      token: prefs.getString('token'),
    ),
  );
}

class MyApp extends StatelessWidget {
  var token;
  MyApp({@required this.token, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegistrationFormProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: (JwtDecoder.isExpired(token) == false)?BottomNav(token: token):const WelcomeScreenOne(),
        // home:  HomePage(),
      ),
    );
  }
}

