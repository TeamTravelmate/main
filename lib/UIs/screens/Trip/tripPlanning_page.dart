import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:intl/intl.dart';
import 'package:main/Data/env/apiKeys.dart';

import 'package:flutter/material.dart';
import 'package:main/Domain/provider/trip_provider.dart';
import 'package:main/UIs/screens/Trip/tripView_page.dart';
import '../../themes/colors.dart';
import 'publicTrip/publicTripsAll_page.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

// ignore: must_be_immutable, camel_case_types
class trip extends ConsumerWidget {
//public trips
  Widget publicTrips = Container(
    child: const publicTripsAll(),
  );
//customize trips
  Widget customizeTrips = Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
    width: double.infinity,
    child: const Customize(),
  );
  //planning trip
  Widget tripPlanning = Container(
    child: joinedTripView(),
  );

  List<Widget> tabContent = [];
  List<Tab> tabs = [];

  trip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripRequest = ref.watch(tripPlanningNotifierProvider);
    tabContent = [publicTrips, customizeTrips];
    tabs = [
      const Tab(
        text: "Public Trips",
      ),
      const Tab(
        text: "Customize Trips",
      ),
    ];
    tripRequest.when(
      data: (tripRequset) {
        if (tripRequset.tripId != null) {
          tabs = [
            const Tab(
              text: "Public Trips",
            ),
            const Tab(
              text: "Trip Planning",
            ),
          ];
          tabContent = [publicTrips, tripPlanning];
        }
      },
      loading: () {
        tabs = [
          const Tab(
            text: "Public Trips",
          ),
          const Tab(
            text: "Customize Trips",
          ),
        ];
        tabContent = [
          publicTrips,
          Center(
            child: const CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        ];
      },
      error: (e, s) {
        tabs = [
          const Tab(
            text: "Public Trips",
          ),
          const Tab(
            text: "Customize Trips",
          ),
        ];
        print(e);
        //run a future to refresh the provider after 5 seconds
        Future.delayed(const Duration(seconds: 5), () {
          ref.refresh(tripPlanningNotifierProvider);
        });
        tabContent = [publicTrips, customizeTrips];
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Something went wrong',
              ),
              backgroundColor: Color(0xffD32F2F),
            ),
          );
        });
      },
    );
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          // leading: BackButton(),
          backgroundColor: ColorsTravelMate.tertiary,
          foregroundColor: ColorsTravelMate.primary,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: BackButton(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TabBar(
                    indicatorColor: ColorsTravelMate.secundary,
                    labelColor: ColorsTravelMate.secundary,
                    isScrollable: true,
                    tabs: tabs,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: TabBarView(
            children: tabContent,
          ),
        ),
      ),
    );
  }
}

class Customize extends StatefulWidget {
  const Customize({super.key});

  @override
  State<Customize> createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  final _formKey = GlobalKey<FormState>();
  final formatter = DateFormat.yMMMd();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _numberOfDaysController = TextEditingController();
  double? lat;
  double? lng;
  DateTime? _selectedDate;
  Future<void>? _pendingTripCreation;

void _presentDatePicker() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year, now.month+4);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate!.add(const Duration(hours: 6));
      _startDateController.text = formatter.format(_selectedDate!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  GooglePlaceAutoCompleteTextField(
                    textEditingController: _destinationController,
                    googleAPIKey: mapApi,
                    countries: ["LK"],
                    // isCrossBtnShown: false,
                    inputDecoration: InputDecoration(
                      hintText: "Where to go?",
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                    boxDecoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    itemClick: (Prediction prediction) {
                      _destinationController.text = prediction.description!;
                    },
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      lat = double.parse(prediction.lat!.toString());
                      lng = double.parse(prediction.lng!.toString());
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Start Date',
                      hintText: 'Select a start date',
                      prefixIcon: Icon(Icons.calendar_month),
                    ),
                    controller: _startDateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a start date';
                      }
                      return null;
                    },
                    //make the presentdatepicker function and dont allow the user to type
                    onTap: () {
                      _presentDatePicker();
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'No. of Days',
                      hintText: 'Enter the no. of days',
                      prefixIcon: Icon(Icons.people_alt),
                    ),
                    controller: _numberOfDaysController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the number of days';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FutureBuilder(
                        future: _pendingTripCreation,
                        builder: (context, snapshot) {
                          var isLoading = snapshot.connectionState ==
                              ConnectionState.waiting;
                          return TextButton(
                            onPressed: () {
                              if (isLoading == true) {
                                return;
                              }
                              if (_formKey.currentState!.validate()) {
                                final future = ref
                                    .read(tripPlanningNotifierProvider.notifier)
                                    .createTrip({
                                  "startDate": _selectedDate.toString(),
                                  "numberOfDays": _numberOfDaysController.text,
                                  "destination": _destinationController.text,
                                  "category": "Private"
                                });
                                setState(() {
                                  _pendingTripCreation = future;
                                });
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  ColorsTravelMate.primary),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            //child based on snapshot
                            child: (isLoading == true)
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text('Create Trip'),
                          );
                        }),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () => newMethod,
                      child: const Text("+ Invite Friends")),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> newMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(
                color: Colors.grey,
                thickness: 4,
                indent: 110,
                endIndent: 110,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Share your trip',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: const Color.fromARGB(255, 69, 68, 68),
                    ),
                    child: const Text('Can Edit'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 69, 68, 68),
                    ),
                    child: const Text('View Only'),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: const Color(0xffE0E0E0),
                        foregroundColor: const Color.fromARGB(255, 69, 68, 68),
                        child: const Icon(Icons.link),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      const Text(
                        'Copy Link',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 69, 68, 68)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: const Color(0xffE0E0E0),
                        foregroundColor: const Color.fromARGB(255, 69, 68, 68),
                        child: const Icon(Icons.message),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      const Text(
                        'Text',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 69, 68, 68)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: const Color(0xffE0E0E0),
                        foregroundColor: const Color.fromARGB(255, 69, 68, 68),
                        child: const Icon(Icons.upload),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      const Text(
                        'Other',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 69, 68, 68)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
