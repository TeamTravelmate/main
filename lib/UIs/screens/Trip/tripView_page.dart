import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/tripCard_widget.dart';

// ignore: must_be_immutable, camel_case_types
class joinedTripView extends StatelessWidget {
  List<Tab> tabs = [
    const Tab(
      child: Text('Overview'),
    ),
    const Tab(
      child: Text('Iterinary'),
    ),
    const Tab(
      child: Text('Budget'),
    ),
    const Tab(
      child: Text('Explore'),
    ),
  ];

  List<Widget> tabContent = [
    Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: const overview(),
    ),
    Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: const iterinary(),
    ),
    Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: const budget(),
    ),
    Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: const explore(),
    ),
  ];

  joinedTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
        child: Expanded(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/galle public.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton.small(
                            backgroundColor: ColorsTravelMate.tertiary,
                            onPressed: () {},
                            child: const CircleAvatar(
                              backgroundColor: ColorsTravelMate.tertiary,
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: ColorsTravelMate.primary,
                              ),
                            ),
                          ),
                          FloatingActionButton.small(
                            backgroundColor: ColorsTravelMate.tertiary,
                            onPressed: () {},
                            child: const CircleAvatar(
                              backgroundColor: ColorsTravelMate.tertiary,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: ColorsTravelMate.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 250.0),
                    child: tripCard(
                      tripLocationTitle: 'Galle - Kandy\n',
                      location: '  Galle Fort, Unawatuna Beach',
                      tripDuration: '  July 3, 2023 - July 6, 2023 (3 days)',
                      tripmates: '  Kumar & 5 others',
                    ),
                  ),
                ],
              ),
              DefaultTabController(
                length: tabs.length,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 420),
                      child: TabBar(
                        indicatorColor: ColorsTravelMate.secundary,
                        labelColor: ColorsTravelMate.secundary,
                        unselectedLabelColor: ColorsTravelMate.primary,
                        isScrollable: true,
                        tabs: tabs,
                      ),
                    ),
                    Container(
                      child: TabBarView(
                        children: tabContent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class overview extends StatelessWidget {
  const overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// ignore: camel_case_types
class iterinary extends StatelessWidget {
  const iterinary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Iterinary'),
    );
  }
}

// ignore: camel_case_types
class budget extends StatelessWidget {
  const budget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Budget'),
    );
  }
}

// ignore: camel_case_types
class explore extends StatelessWidget {
  const explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Explore'),
    );
  }
}
