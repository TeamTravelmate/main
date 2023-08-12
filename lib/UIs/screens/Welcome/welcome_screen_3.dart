import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/UIs/screens/Welcome/welcome_screen_1.dart';
import 'package:main/UIs/themes/colors.dart';

class WelcomeScreenThree extends StatelessWidget {
  const WelcomeScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/ls_3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150, // Replace with your desired width
                      child: Image.asset('assets/img/TravelMate_Logo.png'),
                    ),
                    const Text(
                      'Let\'s start',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const Text(
                      'Wandering in Sri Lanka',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Qwingley',
                        color: ColorsTravelMate.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 250,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the other screen here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreenOne(),
                      ),
                    );
                  },
                  child: SvgPicture.asset('assets/svg/next-btn.svg'),
                ),
                const SizedBox(height: 55),
                SvgPicture.asset('assets/svg/screen-steps.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
