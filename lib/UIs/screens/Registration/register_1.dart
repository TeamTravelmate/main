import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: 390,
      height: 844,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
          gradient: const LinearGradient(
              begin: Alignment(-0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF0C1C33), Color(0xFF2FACBB)],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
          ),
      ),
      child: Stack(
          children: [
              Positioned(
                  left: 0,
                  top: 810,
                  child: Container(
                      width: 390,
                      height: 34,
                      padding: const EdgeInsets.only(
                          top: 21,
                          left: 128,
                          right: 128,
                          bottom: 8,
                      ),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Container(
                                  width: 134,
                                  height: 5,
                                  decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100),
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  child: SizedBox(
                      width: 390,
                      height: 58,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                              Expanded(
                                  child: Container(
                                      height: double.infinity,
                                      padding: const EdgeInsets.only(left: 10, bottom: 3),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                              Container(
                                                  width: 54,
                                                  height: 21,
                                                  padding: const EdgeInsets.only(top: 1),
                                                  decoration: ShapeDecoration(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(24),
                                                      ),
                                                  ),
                                                  child: const Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                          SizedBox(
                                                              width: 54,
                                                              height: 20,
                                                              child: Text(
                                                                  '9:41',
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 16,
                                                                      fontFamily: 'SF Pro Text',
                                                                      fontWeight: FontWeight.w600,
                                                                      height: 21,
                                                                      letterSpacing: -0.32,
                                                                  ),
                                                              ),
                                                          ),
                                                      ],
                                                  ),
                                              ),
                                          ],
                                      ),
                                  ),
                              ),
                              Expanded(
                                  child: Container(
                                      height: double.infinity,
                                      padding: const EdgeInsets.only(right: 11),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                              Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                      const SizedBox(width: 8),
                                                      Container(
                                                          width: 17,
                                                          height: 11.83,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage("https://via.placeholder.com/17x12"),
                                                                  fit: BoxFit.fill,
                                                              ),
                                                          ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      const SizedBox(
                                                          width: 27.40,
                                                          height: 13,
                                                          child: Stack(children: [
                                                          
                                                          ]),
                                                      ),
                                                  ],
                                              ),
                                          ],
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
              const Positioned(
                  left: 33,
                  top: 135,
                  child: Text(
                      'What’s your name?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 21,
                          letterSpacing: -0.32,
                      ),
                  ),
              ),
              const Positioned(
                  left: 32,
                  top: 172,
                  child: SizedBox(
                      width: 353,
                      child: Text(
                          'Enter the name you use in real life.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 21,
                              letterSpacing: -0.32,
                          ),
                      ),
                  ),
              ),
              Positioned(
                  left: 32,
                  top: 216,
                  child: Container(
                      width: 320,
                      height: 60,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFF6B6B6B)),
                              borderRadius: BorderRadius.circular(15),
                          ),
                      ),
                  ),
              ),
              Positioned(
                  left: 31,
                  top: 297,
                  child: Container(
                      width: 320,
                      height: 60,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFF6B6B6B)),
                              borderRadius: BorderRadius.circular(15),
                          ),
                      ),
                  ),
              ),
              const Positioned(
                  left: 54,
                  top: 236,
                  child: Text(
                      'First name',
                      style: TextStyle(
                          color: Color(0xFF6E6E6E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 21,
                          letterSpacing: -0.32,
                      ),
                  ),
              ),
              const Positioned(
                  left: 54,
                  top: 317,
                  child: Text(
                      'Last name',
                      style: TextStyle(
                          color: Color(0xFF6E6E6E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 21,
                          letterSpacing: -0.32,
                      ),
                  ),
              ),
              const Positioned(
                  left: 89,
                  top: 789,
                  child: Text.rich(
                      TextSpan(
                          children: [
                              TextSpan(
                                  text: 'Already has an account? ',
                                  style: TextStyle(
                                      color: Color(0xFF0C1C33),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 21,
                                      letterSpacing: -0.32,
                                  ),
                              ),
                              TextSpan(
                                  text: 'Log in',
                                  style: TextStyle(
                                      color: Color(0xFF0C1C33),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 21,
                                      letterSpacing: -0.32,
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
              Positioned(
                  left: 45,
                  top: 715,
                  child: Container(
                      width: 300,
                      height: 50,
                      decoration: const BoxDecoration(
                          boxShadow: [
                              BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                  spreadRadius: 0,
                              )
                          ],
                      ),
                      child: Stack(
                          children: [
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 300,
                                      height: 50,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFF0C1C33),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                          ),
                                      ),
                                  ),
                              ),
                              const Positioned(
                                  left: 133,
                                  top: 14,
                                  child: Text(
                                      'Next',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 21,
                                          letterSpacing: -0.32,
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
              Positioned(
                  left: 62,
                  top: 374,
                  child: Container(
                      width: 341,
                      height: 341,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: const Stack(
                          children: [
                              Positioned(
                                  left: 16.55,
                                  top: 201.51,
                                  child: SizedBox(
                                      width: 192.72,
                                      height: 88.14,
                                      child: Stack(children: [
                                      
                                      ]),
                                  ),
                              ),
                              Positioned(
                                  left: 13.80,
                                  top: 133.98,
                                  child: SizedBox(
                                      width: 155.61,
                                      height: 150.57,
                                      child: Stack(
                                          children: [
                                              Positioned(
                                                  left: 12.24,
                                                  top: 34.87,
                                                  child: SizedBox(
                                                      width: 143.37,
                                                      height: 115.70,
                                                      child: Stack(children: [
                                                      
                                                      ]),
                                                  ),
                                              ),
                                              Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: SizedBox(
                                                      width: 143.38,
                                                      height: 115.70,
                                                      child: Stack(
                                                          children: [
                                                              Positioned(
                                                                  left: 60.25,
                                                                  top: 32.47,
                                                                  child: Opacity(
                                                                      opacity: 0.15,
                                                                      child: SizedBox(
                                                                          width: 83.13,
                                                                          height: 83.21,
                                                                          child: Stack(children: [
                                                                          
                                                                          ]),
                                                                      ),
                                                                  ),
                                                              ),
                                                              Positioned(
                                                                  left: -0,
                                                                  top: 45.93,
                                                                  child: Opacity(
                                                                      opacity: 0.30,
                                                                      child: SizedBox(
                                                                          width: 60.26,
                                                                          height: 69.76,
                                                                          child: Stack(children: [
                                                                          
                                                                          ]),
                                                                      ),
                                                                  ),
                                                              ),
                                                          ],
                                                      ),
                                                  ),
                                              ),
                                          ],
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 122.86,
                                  top: 67.03,
                                  child: SizedBox(
                                      width: 88.33,
                                      height: 209.09,
                                      child: Stack(children: [
                                      
                                      ]),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
              Positioned(
                  left: 29,
                  top: 66,
                  child: SizedBox(
                      width: 36,
                      height: 36,
                      child: Stack(
                          children: [
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: const ShapeDecoration(
                                          color: Colors.white,
                                          shape: OvalBorder(),
                                          shadows: [
                                              BoxShadow(
                                                  color: Color(0x3F000000),
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                              )
                                          ],
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 6,
                                  top: 6,
                                  child: Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Stack(children: [
                                      
                                      ]),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
          ],
      ),
    ),
    );
  }
}