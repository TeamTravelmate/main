import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:main/Data/env/env.dart';
import 'package:main/Domain/models/trip.dart';
import 'package:main/UIs/screens/Trip/tripPlanning2_page.dart';
import 'package:slide_countdown/slide_countdown.dart';
import '../../themes/colors.dart';
import '../../widgets/tripCard_widget.dart';
import 'upload_pic.dart';
import 'package:http/http.dart' as http;
import 'invitematesForm.dart';
import 'publicTrip/joinPublicTripForm.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

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
          '$backendUrl/get-trip/$tripId'), // Update the URL accordingly
    );

    if (response.statusCode == 200) {
      var rawResponseData = json.decode(response.body) as Map<String, dynamic>;
      var responseData = (rawResponseData["trips"] as List<dynamic>)[0] as Map<String, dynamic>;
      print(responseData);
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
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
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
                        Iterinarytab(),
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


//overview tab
class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text('Start in:   ', style: TextStyle(fontSize: 20)),
            SlideCountdownSeparated(
              duration: Duration(days: 2),
              // durationTitle: DurationTitle.en(),
              separatorType: SeparatorType.symbol,
              slideDirection: SlideDirection.up,
              height: 60.0,
              width: 60.0,
              textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              decoration: BoxDecoration(
                  color: ColorsTravelMate.secundary,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
        ],
      ),
    );
  }
}


//itinerary tab
class Itinerary {
  final String destination;
  final String activity;

  Itinerary(this.destination, this.activity);
}

class ItineraryTimeline extends StatefulWidget {
  final List<Itinerary> userItinerary;
  final int dayCounter;

  const ItineraryTimeline(
      {Key? key, required this.userItinerary, required this.dayCounter})
      : super(key: key);

  @override
  State<ItineraryTimeline> createState() => _ItineraryTimelineState();
}

class _ItineraryTimelineState extends State<ItineraryTimeline> {
  IconData?TimelineIcon(String activity) {
    switch (activity) {
      case "surfing":
      return Icons.beach_access;
    case "hiking":
      return Icons.hiking;
    case "boat riding":
      return Icons.directions_boat_rounded;
    case "cycling":
      return Icons.directions_bike_rounded;
    case "diving":
      return Icons.scuba_diving;
    case "camping":
      return Icons.bungalow_rounded;
    default:
      return Icons.location_on;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Timeline(
      children: widget.userItinerary.asMap().entries.map((entry) {
        final index = entry.key;
        final activity = entry.value;
        final dayNumber = widget.dayCounter + index + 1;

        return TimelineModel(
          GestureDetector(
            child: Card(
              child: ListTile(
                title: Text('Day $dayNumber'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(activity.destination),
                    Text(activity.activity),
                  ],
                ),
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Delete Itinerary'),
                  content:
                      Text('Are you sure you want to delete this itinerary?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          widget.userItinerary.removeAt(index);
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
          iconBackground: Color.fromARGB(255, 255, 196, 68),
          icon: Icon(TimelineIcon(activity.activity), color: Colors.white),
        );
      }).toList(),
    );
  }
}

class Iterinarytab extends StatefulWidget {
  const Iterinarytab({super.key});

  @override
  State<Iterinarytab> createState() => _IterinarytabState();
}

class _IterinarytabState extends State<Iterinarytab> {
  final List<Itinerary> userItinerary = [];
  int dayCounter = 0;

  void _addItinerary(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final formKey = GlobalKey<FormState>();
        int dayCounter = 1;
        String destination = '';
        String activity = '';
        TextEditingController destinationController = TextEditingController();
        TextEditingController activityController = TextEditingController();

        String errorMessage = '';

        @override
        void dispose() {
          destinationController.dispose();
          activityController.dispose();
          super.dispose();
        }

        return Form(
          key: formKey,
          child: AlertDialog(
            title: Text('Add Itinerary'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Day ${dayCounter + 1}'),
                TextField(
                  onChanged: (value) {
                    destination = value;
                  },
                  controller: destinationController,
                  decoration: InputDecoration(labelText: 'Destination'),
                ),
                TextField(
                  onChanged: (value) {
                    activity = value;
                  },
                  controller: activityController,
                  decoration: InputDecoration(labelText: 'Activity'),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (destination.isEmpty || activity.isEmpty) {
                    // Set the error message if any field is empty
                    setState(() {
                      errorMessage = 'All fields are required.';
                    });
                  } else {
                    setState(() {
                      userItinerary.add(Itinerary(destination, activity));
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Add'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorsTravelMate.tertiary),
                  foregroundColor: const MaterialStatePropertyAll(
                      ColorsTravelMate.secundary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ItineraryTimeline(
                  dayCounter: dayCounter, userItinerary: userItinerary)),
          Padding(
            padding: const EdgeInsets.only(left: 300.0),
            child: FloatingActionButton(
              onPressed: () => _addItinerary(context),
              child: const Icon(Icons.add),
              backgroundColor: ColorsTravelMate.secundary,
            ),
          ),
        ],
      ),
    );
  }
}

// class Iterinary extends StatefulWidget {
//   const Iterinary({Key? key}) : super(key: key);

//   @override
//   _IterinaryState createState() => _IterinaryState();
// }

// class _IterinaryState extends State<Iterinary> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'No iterinary yet!',
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w700,
//                   color: ColorsTravelMate.primary),
//             ),
//             FloatingActionButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => AddIterinaryForm()));
//                 },
//                 child: const Icon(Icons.add)),
//           ],
//         ),
//       ),
//     );
//   }
// }


//budget tab
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

//explore tab
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('No tripmates yet!',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorsTravelMate.primary)),
              const SizedBox(height: 10),
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
                          fontSize: 14, color: ColorsTravelMate.tertiary))),
            ]),
          ),
        ));
  }
}
