import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main/UIs/screens/Trip/joinPublicTripForm.dart';
import 'package:main/UIs/screens/Trip/tripView_page.dart';
import '../../themes/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/tripCard_widget.dart';

class publicTripView extends StatefulWidget {
  @override
  _publicTripViewState createState() => _publicTripViewState();
}

class _publicTripViewState extends State<publicTripView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
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
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 150.0),
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
                  buttonWidget(width: 200, labelText: 'Join Tour', path: publicTripForm()),
                  SizedBox(height: 10,)
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
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
      vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available slots: 10',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic,
                  fontSize: 16
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                const Text('Start in:   ', style: TextStyle(fontSize: 20)),
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsTravelMate.secundary,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '05',
                        style: TextStyle(
                            color: ColorsTravelMate.tertiary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Days',
                        style: TextStyle(
                          color: ColorsTravelMate.tertiary,
                          fontSize: 16,),),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsTravelMate.secundary,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '12',
                        style: TextStyle(
                            color: ColorsTravelMate.tertiary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Hours',
                        style: TextStyle(
                          color: ColorsTravelMate.tertiary,
                          fontSize: 16,),),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsTravelMate.secundary,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '30',
                        style: TextStyle(
                            color: ColorsTravelMate.tertiary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Mins',
                        style: TextStyle(
                          color: ColorsTravelMate.tertiary,
                          fontSize: 16,),),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsTravelMate.secundary,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '10',
                        style: TextStyle(
                            color: ColorsTravelMate.tertiary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Sec',
                        style: TextStyle(
                          color: ColorsTravelMate.tertiary,
                          fontSize: 16,),),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(
                vertical: 10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              child: Text(
                'Please bring enough water bottles!',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(
                  vertical: 10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              child: Text(
                'Make sure to bring caps, hats or umbrellas as it will be sunny there!',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                ),
              ),
            ),
          ],
        ),
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
      child: SingleChildScrollView(
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
