
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:main/Domain/provider/register_form_provider.dart';
import 'package:main/UIs/screens/Trip/tripView_page.dart';
import 'package:main/UIs/screens/login/login_page.dart';
import 'package:main/UIs/widgets/bottom_nav.dart';
import 'package:provider/provider.dart' as provider;
import 'package:shared_preferences/shared_preferences.dart';
import 'Domain/services/notification_services.dart';
import 'UIs/screens/Welcome/welcome_screen_1.dart';

// Main function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));

  runApp(ProviderScope(
    child: MyApp(
      token: prefs.getString('token'),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({this.token, super.key});

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(
            create: (context) => RegistrationFormProvider())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.white,
        ).copyWith(useMaterial3: true),
        // home: (JwtDecoder.isExpired(token!) == false)?BottomNav(token: token):const WelcomeScreenOne(),
        // home: const WelcomeScreenOne(),
        home: redirect(token),
      ),
    );
  }
}

Widget redirect(token) {
  if (token != null) {
    if (token.isEmpty) {
      return const LoginScreen();
    }
    if (JwtDecoder.isExpired(token) == false) {
      return BottomNav(token: token);
    } else {
      return LoginScreen();
    }
  }
  return const WelcomeScreenOne();
}
