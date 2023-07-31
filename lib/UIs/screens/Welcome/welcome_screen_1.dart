import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/UIs/screens/Welcome/welcome_screen_2.dart';
import 'package:main/UIs/themes/colors.dart';

class WelcomeScreenOne extends StatelessWidget {
  const WelcomeScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2FACBB),
              Color(0xFF90CAF9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/img/logo-travelmate.png'),
                const SizedBox(height: 46.1),
                const Text(
                'DISCOVER. EXPLORE. CONNECT.',
                
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1.5, 
                  ),
                ),
                const SizedBox(height: 1),
                const SizedBox(
                  child: Center(
                    child: Text(
                    'Welcome to Your Personalized',
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        
                        color: ColorsTravelMate.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 25, 
                      ),
                    ),
                  ),
                ),
                 const SizedBox(
                   child: Center(
                     child: Text(
                        'Travel Experience',
                        textAlign: TextAlign.center,
                          style: TextStyle(                            
                            color: ColorsTravelMate.primary,
                            fontWeight: FontWeight.w800,
                            fontSize: 25, 
                          ),
                        ),
                   ),
                 ),
                 const SizedBox(height: 75),
                 Image.asset('assets/img/travel-selfie.png'),
                 const SizedBox(height: 120),
                GestureDetector(
                  onTap: () {
                    // Navigate to the other screen here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreenTwo(),
                      ),
                    );
                  },
                  child: SvgPicture.asset('assets/svg/next-btn.svg'),
                ),
                 const SizedBox(height: 55),
                SvgPicture.asset('assets/svg/screen-steps.svg'),
              ]
            ),
          ),
        ),
      ),
    );
  }
}