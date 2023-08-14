import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main/UIs/screens/Trip/tripPlanning2_page.dart';
import '../../themes/colors.dart';
import '../../widgets/tripCard_widget.dart';
import 'upload_pic.dart';

class joinedTripView extends StatefulWidget {
  final tripId;

  const joinedTripView({@required this.tripId , super.key});

  @override
  _joinedTripViewState createState() => _joinedTripViewState();
}

class _joinedTripViewState extends State<joinedTripView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Plan()),
            );
            },
            backgroundColor: ColorsTravelMate.primary,
            child: const Icon(Icons.add),
          ),
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
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                    return Uploadpic();
                                  }));
                                },
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
                      Tab(text: "People"),
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
                        People()
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
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Budget Per Person: Rs.3500',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Total Budget: Rs.70000',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Food',
                                style: TextStyle(
                                    color: ColorsTravelMate.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                'Rs.1000',
                                style: TextStyle(
                                    color: ColorsTravelMate.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Breaksfast - ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),
                              Text(
                                'Rs. 300 ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Lunch - ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),
                              Text(
                                'Rs. 400 ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Dinner - ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),
                              Text(
                                'Rs. 300 ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Accomodation',
                                style: TextStyle(
                                    color: ColorsTravelMate.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                'Rs.800',
                                style: TextStyle(
                                    color: ColorsTravelMate.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transport',
                                style: TextStyle(
                                    color: ColorsTravelMate.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                'Rs.700',
                                style: TextStyle(
                                    color: ColorsTravelMate.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tour Guide Fee',
                                style: TextStyle(
                                    color: ColorsTravelMate.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                'Rs.1000',
                                style: TextStyle(
                                    color: ColorsTravelMate.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ]
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

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/woman.jpg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'A. M. Perera',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/man.jpg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'A. Pathum Perera',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/girl1.jpeg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Sithumi Perera',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/woman2.jpg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Ranjani Silva',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/man.jpg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Hasantha Kariyawasam',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/man.jpg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Luqman Fazhal',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/woman.jpg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Usha Perera',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/woman2.jpg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Gagana Samarasekara',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/girl.webp'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Buddhi Prabodha',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/img/man.jpg'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Sachin Perera',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
              ]
          ),
        )
    );
  }
}
