import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/UIs/screens/Welcome/welcome_screen_3.dart';
import 'package:main/UIs/themes/colors.dart';

class WelcomeScreenTwo extends StatelessWidget {
  const WelcomeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/ls_2.png'),
                fit: BoxFit.cover,
              ),
            ),
        child: SafeArea(
          child: Center(
            child: Column(
              
              children: [
                const SizedBox(height:200,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(50), // Adjust the padding as needed
                       // Adjust the color and opacity as needed
                      child: const Text(
                        '“The journey of a thousand miles begins with a single step.”',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 1,),

                const Text(
                  'Lao Tzu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),

                const SizedBox(height: 160,),

                 GestureDetector(
                  onTap: () {
                    // Navigate to the other screen here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreenThree(),
                      ),
                    );
                  },
                  child: SvgPicture.asset('assets/svg/next-btn.svg'),
                ),
                 const SizedBox(height: 55),
                SvgPicture.asset('assets/svg/step-2.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}