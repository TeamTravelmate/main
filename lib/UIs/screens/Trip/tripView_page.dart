import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:main/Data/env/env.dart';
import 'package:main/Domain/models/itinerary.dart';
import 'package:main/Domain/models/trip.dart';
import 'package:main/Domain/provider/budget_provider.dart';
import 'package:main/Domain/provider/itinerary_provider.dart';
import 'package:main/UIs/screens/Trip/privateTrips/budget_page.dart';
import 'package:main/UIs/screens/Trip/tripPlanning2_page.dart';
import 'package:main/UIs/widgets/add_starting_place_widget.dart';
import 'package:timelines/timelines.dart';
import 'package:slide_countdown/slide_countdown.dart';
import '../../../Data/env/apiKeys.dart';
import '../../themes/colors.dart';
import '../../widgets/tripCard_widget.dart';
import 'upload_pic.dart';
import 'package:http/http.dart' as http;
import 'invitematesForm.dart';
import 'publicTrip/joinPublicTripForm.dart';
// import 'package:timeline_list/timeline.dart';
// import 'package:timeline_list/timeline_model.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:main/Domain/provider/trip_provider.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class joinedTripView extends ConsumerStatefulWidget {
  const joinedTripView({super.key, required int tripId});

  @override
  _joinedTripViewState createState() => _joinedTripViewState();
}

class _joinedTripViewState extends ConsumerState<joinedTripView> {
  //the provider
  late final tripProvider;
  Trip? _trip;

  @override
  void initState() {
    super.initState();
    tripProvider = ref.read(tripPlanningNotifierProvider);
  }

  @override
  Widget build(BuildContext context) {
    _trip = tripProvider.value;
    ref.read(itineraryNotifierProvider);
    ref.read(budgetNotifierProvider(_trip!.tripId));
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                        padding: const EdgeInsets.only(top: 100.0),
                        child: //use the provider to display the tripcard. Its an async provider
                            switch (tripProvider) {
                          AsyncData(:final value) => tripCard(
                              tripLocationTitle:
                                  "Trip to ${value.destination != null ? value.destination.split(',')[0] : "Undefined"}",
                              tripDuration:
                                  "${value.startDate} - ${value.numberOfDays.toString()} days",
                              tripmates: value.adultCount != null
                                  ? value.adultCount.toString()
                                  : "",
                              location: value.destination ?? "Undefined",
                            ),
                          AsyncError(:final error) => Center(
                              child: Text(
                                error.toString(),
                                style: const TextStyle(
                                  color: ColorsTravelMate.primary,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          _ => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        }),
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
                      BudgetPage(),
                      Explore(),
                      People()
                    ],
                  ),
                ),
              ],
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
  //current date
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final trip = ref.watch(tripPlanningNotifierProvider);

              final duration = trip.value!.startDate != null
                  ? DateFormat('EEE, M/d/y')
                      .parse(trip.value!.startDate!)
                      .difference(DateTime.now())
                  : Duration(days: 0);
              if (duration.isNegative) {
                return Text('The trip has already started');
              }
              return Column(
                children: [
                  Text('Start in:   ', style: TextStyle(fontSize: 20)),
                  SlideCountdownSeparated(
                    duration: duration,
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
                  SizedBox(height: 20),
                  //Starting location display
                  Row(
                    children: [
                      const Text('Starting Location: ',
                          style: TextStyle(fontSize: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //add a total amount of expenses
                          Text(
                            trip.value!.startPlace!.split(',')[0] ??
                                "Add where you'll start",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          (trip.value!.startPlace == null)
                              ? AddStartingPlace(context: context)
                              : Container(),
                        ],
                      ),
                      //add a button to change the starting location
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ItineraryTimeline extends StatefulWidget {
  final Itinerary userItinerary;

  const ItineraryTimeline({Key? key, required this.userItinerary})
      : super(key: key);

  @override
  State<ItineraryTimeline> createState() => _ItineraryTimelineState();
}

class _ItineraryTimelineState extends State<ItineraryTimeline> {
  IconData? TimelineIcon(String activity) {
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

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    //a timeline with dummy datas
    //use a timeline builder to display the iterinary
    return Consumer(
      builder: (context, ref, child) {
        final itineraryElements = widget.userItinerary.itineraryElements;
        return Timeline.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            // final itineraryElements = widget.userItinerary.itineraryElements.;
            //filter all the elements with the same day. day is the index + 1
            final filteredElements = itineraryElements!.where((element) {
              return element.day == index + 1;
            }).toList();
            return TimelineModel(
                Card(
                  child: Column(
                    children: [
                      Text(
                        'Day ${index + 1}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (var element in filteredElements)
                        ListTile(
                          title: Text(element.location!),
                          subtitle: Text(element.activity!),
                        ),
                    ],
                  ),
                ),
                position: index % 2 == 0
                    ? TimelineItemPosition.right
                    : TimelineItemPosition.left,
                iconBackground: ColorsTravelMate.secundary,
                icon: Icon(
                  TimelineIcon(filteredElements.firstWhere((element) {
                    return element.activity != null;
                  }, orElse: () => ItineraryElements(activity: "")).activity!),
                  color: ColorsTravelMate.tertiary,
                ));
          },
          itemCount:
              ref.read(tripPlanningNotifierProvider).value!.numberOfDays!,
          physics: const BouncingScrollPhysics(),
          position: TimelinePosition.Center,
          shrinkWrap: true,
        );
      },
    );
  }
}

class Iterinarytab extends ConsumerStatefulWidget {
  const Iterinarytab({super.key});

  @override
  ConsumerState<Iterinarytab> createState() => _IterinarytabState();
}

class _IterinarytabState extends ConsumerState<Iterinarytab> {
  var userItinerary;
  @override
  void initState() {
    super.initState();
    // userItinerary = ref.read(itineraryNotifierProvider);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _addItinerary(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final formKey = GlobalKey<FormState>();
        TextEditingController locationController = TextEditingController();
        TextEditingController activityController = TextEditingController();
        int dayNumber = 1;

        @override
        void dispose() {
          locationController.dispose();
          activityController.dispose();
          super.dispose();
        }

        return Form(
          key: formKey,
          child: AlertDialog(
            title: const Text('Add Itinerary'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //date picker
                Consumer(
                  builder: (context, ref, child) {
                    final trip = ref.read(tripPlanningNotifierProvider);
                    final duration = trip.value!.numberOfDays;
                    return DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          hintText: "Day",
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        value: dayNumber,
                        items: [
                          //use a list builder to diplay the days
                          for (int i = 1; i <= duration!; i++)
                            DropdownMenuItem(
                              child: Text('Day $i'),
                              value: i,
                            ),
                        ],
                        onChanged: (value) {
                          dayNumber = value!;
                        },
                      ),
                    );
                  },
                ),
                GooglePlaceAutoCompleteTextField(
                  textEditingController: locationController,
                  googleAPIKey: mapApi,
                  countries: ["LK"],
                  inputDecoration: const InputDecoration(
                    hintText: "Destination",
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  itemClick: (Prediction prediction) {
                    locationController.text = prediction.description!;
                  },
                  isLatLngRequired: false,
                ),
                TextField(
                  controller: activityController,
                  decoration: const InputDecoration(labelText: 'What to do?'),
                  autocorrect: true,
                  enableSuggestions: true,
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  userItinerary.itineraryElements!.add(ItineraryElements(
                      day: dayNumber,
                      location: locationController.text,
                      activity: activityController.text));

                  ref.read(itineraryNotifierProvider.notifier).createItinerary(
                      ItineraryElements(
                          day: dayNumber,
                          location: locationController.text,
                          activity: activityController.text));
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorsTravelMate.secundary),
                  foregroundColor:
                      MaterialStatePropertyAll(ColorsTravelMate.tertiary),
                ),
                child: const Text('Add'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ColorsTravelMate.tertiary),
                  foregroundColor:
                      MaterialStatePropertyAll(ColorsTravelMate.secundary),
                ),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userItineraryProvider = ref.watch(itineraryNotifierProvider);
    userItineraryProvider.whenData((value) =>
        userItinerary = Itinerary(itineraryElements: value.itineraryElements));
    return switch (userItineraryProvider) {
      AsyncData(:final value) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addItinerary(context),
                ),
              ],
            ),
            Expanded(
              child: ItineraryTimeline(userItinerary: value),
            ),
          ],
        ),
      AsyncError(:final error) => Center(
          child: Text(
            error.toString(),
            style: const TextStyle(
              color: ColorsTravelMate.primary,
              fontSize: 20,
            ),
          ),
        ),
      _ => const Center(
          child: CircularProgressIndicator(),
        ),
    };
  }
}

//budget tab
class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  _BudgetState createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: []),
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
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsTravelMate.secundary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 14, color: ColorsTravelMate.tertiary)),
                  child: const Text('Invite Tripmates')),
            ]),
          ),
        ));
  }
}
