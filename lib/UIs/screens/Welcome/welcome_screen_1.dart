import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/UIs/screens/Welcome/welcome_screen_2.dart';
import 'package:main/UIs/themes/colors.dart';

class WelcomeScreenOne extends StatelessWidget {
  const WelcomeScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
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
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Image.asset('assets/img/logo-travelmate.png',),
                      const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                            'DISCOVER. EXPLORE. CONNECT.',
                            
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1.5, 
                              ),
                            ),
                            SizedBox(
                              child: Center(
                                child: Text(
                                'Welcome to Your Personalized',
                                textAlign: TextAlign.center,
                                  style: TextStyle(
                                    
                                    color: ColorsTravelMate.primary,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20, 
                                  ),
                                ),
                              ),
                            ),
                             SizedBox(
                               child: Center(
                                 child: Text(
                                    'Travel Experience',
                                    textAlign: TextAlign.center,
                                      style: TextStyle(                            
                                        color: ColorsTravelMate.primary,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20, 
                                      ),
                                    ),
                               ),
                             ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                 Image.asset('assets/img/travel-selfie.png'),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                      SvgPicture.asset('assets/svg/screen-steps.svg'),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
