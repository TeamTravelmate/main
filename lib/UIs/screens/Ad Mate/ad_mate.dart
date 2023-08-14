import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main/UIs/widgets/appbar_title_with_icon.dart';

class AdMate extends StatelessWidget {
  const AdMate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const AppBarTitleWithIcon(
          icon: Icons.webhook_outlined,
          title: "Ad Mate",
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1.17,
            letterSpacing: -0.32,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            const Positioned(
              left: 22,
              top: 20,
              child: Text(
                'Promote your Business',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 1.31,
                  letterSpacing: -0.32,
                ),
              ),
            ),
            Positioned(
              left: 22,
              top: 80,
              child: Container(
                width: 90,
                height: 97,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 90,
                        height: 97,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCEFEFEF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 15,
                      top: 70,
                      child: Text(
                        'Boost a post',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2.10,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 17,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 33,
                      top: 30,
                      child: Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Stack(children: [
                          Icon(Icons.light_rounded, color: Colors.black)
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 151,
              top: 80,
              child: Container(
                width: 90,
                height: 97,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 90,
                        height: 97,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCEFEFEF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 11,
                      top: 70,
                      child: Text(
                        'Priority Queue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2.10,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 17,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 280,
              top: 80,
              child: Container(
                width: 90,
                height: 97,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 90,
                        height: 97,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCEFEFEF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 23,
                      top: 70,
                      child: Text(
                        'Ads mob',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2.10,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 17,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 183,
              top: 110,
              child: Container(
                width: 24,
                height: 24,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Positioned(
                      left: 2,
                      top: 2,
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Stack(children: [
                          SvgPicture.asset(
                            'assets/svg/solar_star-bold-duotone.svg',
                            semanticsLabel: 'Vector',
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 313,
              top: 110,
              child: Container(
                width: 24,
                height: 24,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Stack(children: [
                  SvgPicture.asset(
                    'assets/svg/ri_google-fill.svg',
                    semanticsLabel: 'Vector',
                  )
                ]),
              ),
            ),
            const Positioned(
              left: 312,
              top: 20,
              child: Text(
                'Help center',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6B6B6B),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  height: 2.10,
                  letterSpacing: -0.32,
                ),
              ),
            ),
            const Positioned(
              left: 294,
              top: 180,
              child: Text(
                'coming soon',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF6B6B6B),
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 2.10,
                  letterSpacing: -0.32,
                ),
              ),
            ),
            const Positioned(
              left: 22,
              top: 220,
              child: Text(
                'My Ads',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 1.31,
                  letterSpacing: -0.32,
                ),
              ),
            ),
            Positioned(
              left: 22,
              top: 280,
              child: Container(
                width: 88,
                height: 31,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 88,
                        height: 31,
                        decoration: ShapeDecoration(
                          color: const Color(0x7FEDEDED),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 0.25,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 17,
                      top: 5,
                      child: Text(
                        'Ongoing',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2.10,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 62,
                      top: 4,
                      child: Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Stack(children: []),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 280,
              top: 280,
              child: Container(
                width: 88,
                height: 31,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 88,
                        height: 31,
                        decoration: ShapeDecoration(
                          color: const Color(0x7FEDEDED),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 0.25,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 5,
                      top: 5,
                      child: Text(
                        'Boost a post',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2.10,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 62,
                      top: 4,
                      child: Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Stack(children: []),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 22,
              top: 320,
              child: Container(
                width: 347,
                height: 175,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 347,
                        height: 175,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCEFEFEF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 7,
                      top: 8,
                      child: Container(
                        width: 332,
                        height: 129,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 332,
                                height: 129,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: -8,
                              top: 0,
                              child: Container(
                                width: 349,
                                height: 349,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/img/ad-cover.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 16,
                      top: 137,
                      child: Text(
                        'Reach',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2.62,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 139,
                      top: 137,
                      child: Text(
                        'Post Engagement',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2.62,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 284,
                      top: 139,
                      child: Text(
                        'Link clicked',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2.62,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 12,
                      top: 153,
                      child: Text(
                        '10.2K',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 159,
                      top: 153,
                      child: Text(
                        '650',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 298,
                      top: 153,
                      child: Text(
                        '54',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                          letterSpacing: -0.32,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 14,
                      child: Container(
                        width: 46,
                        height: 14,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      top: 10,
                      child: Text(
                        'ID A0195',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 7,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 3,
                          letterSpacing: -0.32,
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
    );
  }
}
