import 'package:flutter/material.dart';
import '../../themes/colors.dart';

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
                    child: tripCard(),
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
class tripCard extends StatelessWidget {
  const tripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: ListTile(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Galle - Kandy\n',
                style: TextStyle(
                  fontSize: 20,
                  color: ColorsTravelMate.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite_border_rounded,
                    color: ColorsTravelMate.primary,
                  ),
                  Icon(
                    Icons.file_upload_outlined,
                    color: ColorsTravelMate.primary,
                  ),
                  Icon(
                    Icons.more_horiz_outlined,
                    color: ColorsTravelMate.primary,
                  ),
                ],
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: ColorsTravelMate.primary,
                      ),
                      Text(
                        '  Galle Fort, Unawatuna Beach',
                        style: TextStyle(color: ColorsTravelMate.primary),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: ColorsTravelMate.primary,
                      ),
                      Text(
                        '  July 3, 2023 - July 6, 2023 (3 days)',
                        style: TextStyle(color: ColorsTravelMate.primary),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.supervised_user_circle_sharp,
                        color: ColorsTravelMate.primary,
                      ),
                      Image.asset(
                        'assets/profile.png',
                        width: 20,
                        height: 20,
                      ),
                      const Text(
                        '  Kumar & 5 others',
                        style: TextStyle(color: ColorsTravelMate.primary),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: FloatingActionButton.small(
                    onPressed: () {},
                    backgroundColor: ColorsTravelMate.tertiary,
                    shape: const CircleBorder(
                        side: BorderSide(color: ColorsTravelMate.primary)),
                    child: const Icon(
                      Icons.map_outlined,
                      color: ColorsTravelMate.primary,
                    )),
              )
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
