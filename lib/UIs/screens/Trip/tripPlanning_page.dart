import 'dart:convert';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:main/Data/env/apiKeys.dart';

import 'package:flutter/material.dart';
import 'package:main/Domain/models/trip.dart';
import 'package:main/UIs/screens/Trip/tripView_page.dart';
import '../../themes/colors.dart';
import 'publicTrip/publicTripsAll_page.dart';
import 'package:http/http.dart' as http;
import 'package:google_places_flutter/google_places_flutter.dart';

// ignore: must_be_immutable, camel_case_types
class trip extends StatelessWidget {
  List<Tab> tabs = [
    const Tab(
      child: Text('Public Trips'),
    ),
    const Tab(
      child: Text('Customize Trips'),
    )
  ];

  List<Widget> tabContent = [
    Container(
      child: const publicTripsAll(),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      width: double.infinity,
      child: const Customize(),
    )
  ];

  trip({super.key});

  @override
  Widget build(BuildContext context) {
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
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _numberOfDaysController = TextEditingController();
  int _userId = 1; // Extract this from your JWT token

  Future<void> _sendTripRequest() async {
    if (_formKey.currentState!.validate()) {
      Trip trip = Trip(
        userId: _userId,
        destination: _destinationController.text,
        startDate: _startDateController.text,
        numberOfDays: int.parse(_numberOfDaysController.text),
      );

      final response = await http.post(
        Uri.parse(
            'http://192.168.1.6:3000/trip'), // Replace with your API endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(trip.toJson()),
      );
      print(response.statusCode);

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Trip Created Successfully!'),
          ),
        );

        var responseData = json.decode(response.body);
        var tripId = responseData['trip']['id'];
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => joinedTripView(tripId: tripId)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              // TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: 'Where to go?',
              //     hintText: 'Eg. Galle, Trincomalee',
              //     prefixIcon: Icon(Icons.location_on),
              //   ),
              //   controller: _destinationController,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter a destination';
              //     }
              //     return null;
              //   },
              // ),
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
                isLatLngRequired: false,
              ),

              const SizedBox(height: 20),
              TextFormField(
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
                child: TextButton(
                  onPressed: () {
                    _sendTripRequest();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorsTravelMate.primary),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: const Text('Create my Trip'),
                ),
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
