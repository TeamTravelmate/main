import 'dart:io';
import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import '../../widgets/tripCard_widget.dart';

class joinedTripView extends StatefulWidget {
  @override
  _joinedTripViewState createState() => _joinedTripViewState();
}

class _joinedTripViewState extends State<joinedTripView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.white,
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
                                onPressed: () {
                                  Navigator.pop(context);
                                },
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
                      Padding(
                        padding: EdgeInsets.only(top: 250.0),
                        child: tripCard(
                          tripLocationTitle: 'Galle - Kandy\n',
                          location: '  Galle Fort, Unawatuna Beach',
                          tripDuration:
                              '  July 3, 2023 - July 6, 2023 (3 days)',
                          tripmates: '  Kumar & 5 others',
                        ),
                      ),
                    ],
                  ),
                  const TabBar(
                    labelColor: ColorsTravelMate.secundary,
                    indicatorColor: ColorsTravelMate.secundary,
                    unselectedLabelColor: ColorsTravelMate.primary,
                    labelPadding: EdgeInsets.all(0),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    labelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    tabs: [
                      Tab(
                        text: "Overview",
                      ),
                      Tab(text: "Iterinary"),
                      Tab(text: "Budget"),
                      Tab(text: "Explore"),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      // <-- Your TabBarView
                      children: [
                        Overview(),
                        Iterinary(),
                        Budget(),
                        Explore(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          // const Text(
          //   "Broadcast",
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          // ),
          AlertDialog(
            backgroundColor: Colors.grey[300],
            title: const Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "We need more water bottles.\nMake sure to bring at least 1L\nwith you.",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/profile.png',
                  width: 20,
                  height: 20,
                ),
                const Text('Kumara Gamage', style: TextStyle(fontSize: 11)),
                const Text('2:30 PM', style: TextStyle(fontSize: 11)),
                const Text('today', style: TextStyle(fontSize: 11)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Iterinary extends StatefulWidget {
  const Iterinary({Key? key}) : super(key: key);

  @override
  _IterinaryState createState() => _IterinaryState();
}

class _IterinaryState extends State<Iterinary> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Day 1",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                " (July 3, 2023)",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Icon(
                Icons.beach_access,
                color: ColorsTravelMate.secundary,
                size: 20,
              ),
              Text(' Unawatuna Beach', style: TextStyle(fontSize: 14)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Day 2",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                " (July 4, 2023)",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Icon(
                Icons.hiking,
                color: ColorsTravelMate.secundary,
                size: 20,
              ),
              Text(' Hanthana Mountain', style: TextStyle(fontSize: 14)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Day 3",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                " (July 5, 2023)",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Icon(
                Icons.directions_boat,
                color: ColorsTravelMate.secundary,
                size: 20,
              ),
              Text(' Kandy Lake', style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  _BudgetState createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          AlertDialog(
            backgroundColor: Colors.grey[300],
            title: const Text(
              "Approved expenses for this trip will be added here.",
              style: TextStyle(fontSize: 12),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/profile.png',
                  width: 20,
                  height: 20,
                ),
                const Text('Kumara Gamage', style: TextStyle(fontSize: 11)),
                const Text('2:30 PM', style: TextStyle(fontSize: 11)),
                const Text('today', style: TextStyle(fontSize: 11)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(  
                    children: [
                      Icon(
                        Icons.hotel,
                        color: ColorsTravelMate.secundary,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Hotels',
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorsTravelMate.secundary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ColorsTravelMate.secundary,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(  
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: ColorsTravelMate.secundary,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Resturants',
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorsTravelMate.secundary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ColorsTravelMate.secundary,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(  
                    children: [
                      Icon(
                        Icons.local_activity,
                        color: ColorsTravelMate.secundary,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Activities',
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorsTravelMate.secundary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ColorsTravelMate.secundary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
