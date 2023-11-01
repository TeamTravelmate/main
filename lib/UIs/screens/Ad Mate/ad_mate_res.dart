import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:main/UIs/screens/Ad%20Mate/boost_a_post.dart';
import 'package:main/UIs/widgets/ad_variant.dart';
import 'package:main/UIs/widgets/appbar_title_with_icon.dart';
import 'package:main/UIs/widgets/drop_down_button.dart';

class AdMate2 extends StatelessWidget {
  const AdMate2({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Promote your Business',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.31,
                      letterSpacing: -0.32,
                    ),
                  ),
                  Text(
                    'Help center',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6B6B6B),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      height: 2.10,
                      letterSpacing: -0.32,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AdListScreen(),
            ));
                    },
                    child: AdVariant(
                      iconData: Icons.bolt_rounded,
                      adText: 'Boost a post',
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.17,
                        letterSpacing: -0.32,
                      ),
                    ),
                  ),
                  AdVariant(
                    iconSvg: 'assets/svg/solar_star-bold-duotone.svg',
                    adText: 'Priority Queue',
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.17,
                      letterSpacing: -0.32,
                    ),
                    iconType: AdIconType.svg,
                  ),
                  AdVariant(
                    iconData: Icons.android_rounded,
                    adText: 'Google Admob',
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.17,
                      letterSpacing: -0.32,
                    ),
                  ),
                ],
              ),
            ),

            // My Ads
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Ads',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.31,
                      letterSpacing: -0.32,
                    ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButtonWidget(list: [
                    'All',
                    'Active',
                    'Inactive',
                    'Pending',
                    'Rejected',
                  ]),
                  DropdownButtonWidget(list: [
                    'All',
                    'Boost a post',
                    'Priority Queue',
                  ]),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.95,
                  maxWidth: MediaQuery.of(context).size.width * 0.95,
                ),
                decoration: ShapeDecoration(
                  color: const Color(0xCCEFEFEF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 8, right: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 129,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/ad-cover.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Row(children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Reach',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      height: 2.62,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                  Text(
                                    'Post Engagement',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      height: 2.62,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                  Text(
                                    'Link clicked',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      height: 2.62,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '5.2k',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.50,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Text(
                                    '600',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.50,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Text(
                                    '45',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.50,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
