import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main/Domain/models/trip.dart';
import 'package:main/UIs/screens/Trip/tripPlanning2_page.dart';
import '../../themes/colors.dart';
import '../../widgets/tripCard_widget.dart';
import 'package:http/http.dart' as http;
import 'add_iterinary_form.dart';
import 'invitematesForm.dart';
import 'publicTrip/joinPublicTripForm.dart';

class joinedTripView extends StatefulWidget {
  final int tripId;

  const joinedTripView({required this.tripId, super.key});

  @override
  _joinedTripViewState createState() => _joinedTripViewState();
}

class _joinedTripViewState extends State<joinedTripView> {
  late Future<Trip> tripDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tripDetails = fetchTripDetails(widget.tripId);
  }

  Future<Trip> fetchTripDetails(int tripId) async {
    final response = await http.get(
      Uri.parse(
          'http://192.168.198.1:3000/get-trip/$tripId'), // Update the URL accordingly
    );

    if (response.statusCode == 200) {
      var rawResponseData = json.decode(response.body) as Map<String, dynamic>;
      var responseData = (rawResponseData["trips"] as List<dynamic>)[0] as Map<String, dynamic>;
    // Assuming the API response contains a "trip" object
      Trip trip = Trip(
        userId: responseData['userId'],
        destination: responseData['destination'],
        startDate: responseData['startDate'],
        numberOfDays: responseData['numberOfDays'],
        // Add other properties based on your Trip class
      );
      return trip;
    } else {
      throw Exception('Failed to fetch trip details');
    }
  }

  @override
  Widget build(BuildContext context) {
    var trip;
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
                        padding: const EdgeInsets.only(top: 250.0),
                        child: FutureBuilder<Trip>(
                          future: tripDetails,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              Trip trip = snapshot.data as Trip;
                              return tripCard(
                                tripLocationTitle:
                                    'Trip to ${trip.destination}',
                                location: ' ${trip.destination}',
                                tripDuration:
                                    '  ${trip.startDate} - ${trip.numberOfDays} days',
                                tripmates: '  Kumar & 5 others',
                              );
                            } else {
                              return const Text('No data available');
                            }
                          },
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
        children: [],
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
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 20,),
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
              Text('Add destination...'),  
            ],
          ),
          SizedBox(
            height: 10,
          ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddIterinaryForm()));
                    },
                    child: const Text('Add Iterinary'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsTravelMate.secundary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(
                            fontSize: 14,
                            color: ColorsTravelMate.tertiary))),
              ),
            ]),
          ),
        ));
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Total Budget Per Person: Rs.3500',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Text(
                'Total Budget: Rs.70000',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Food',
                            style: TextStyle(
                                color: ColorsTravelMate.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            'Rs.1000',
                            style: TextStyle(
                                color: ColorsTravelMate.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Breaksfast - ',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Text(
                            'Rs. 300 ',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Lunch - ',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Text(
                            'Rs. 400 ',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Dinner - ',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Text(
                            'Rs. 300 ',
                            style: TextStyle(color: Colors.black, fontSize: 12),
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
                                fontSize: 16),
                          ),
                          Text(
                            'Rs.800',
                            style: TextStyle(
                                color: ColorsTravelMate.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
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
                                fontSize: 16),
                          ),
                          Text(
                            'Rs.700',
                            style: TextStyle(
                                color: ColorsTravelMate.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
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
                                fontSize: 16),
                          ),
                          Text(
                            'Rs.1000',
                            style: TextStyle(
                                color: ColorsTravelMate.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
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
      children: [],
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('No tripmates yet!',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorsTravelMate.primary)),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => inviteMateForm()));
                  },
                  child: const Text('Invite Tripmates'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsTravelMate.secundary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: ColorsTravelMate.tertiary))),
            ]),
          ),
        ));
  }
}
