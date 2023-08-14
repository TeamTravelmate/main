import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../themes/colors.dart';

class CustomizeVehicle extends StatefulWidget {
  @override
  _CustomizeVehicleState createState() => _CustomizeVehicleState();
}

class _CustomizeVehicleState extends State<CustomizeVehicle> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Travel Options'),
            backgroundColor: ColorsTravelMate.tertiary,
            foregroundColor: ColorsTravelMate.primary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonsTabBar(
                  backgroundColor: ColorsTravelMate.secundary,
                  unselectedBackgroundColor:
                      ColorsTravelMate.secundary.withOpacity(0.6),
                  labelStyle: const TextStyle(
                    color: ColorsTravelMate.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: ColorsTravelMate.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                  radius: 20,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  tabs: const [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Train",
                    ),
                    Tab(
                      text: "Bus",
                    ),
                    Tab(
                      text: "Car",
                    ),
                    Tab(
                      text: "Other",
                    ),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      All(),
                      Train(),
                      Bus(),
                      Car(),
                      Other(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

// ignore: camel_case_types
class vehicle extends StatelessWidget {
  const vehicle({
    super.key,
    required this.imagepath,
    required this.label,
    required this.path,
  });

  final String imagepath;
  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 150,
      child: ElevatedButton(
          onPressed: _launchURL,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsTravelMate.tertiary,
            foregroundColor: ColorsTravelMate.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                child: Image(
                    image: AssetImage(imagepath), alignment: Alignment.center),
              ),
              Text(label)
            ],
          )),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse(path);
    if (!await launchUrl(url)) {
      var _url;
      throw Exception('Could not launch $_url');
    }
  }
}

class All extends StatefulWidget {
  const All({Key? key}) : super(key: key);

  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://seatreservation.railway.gov.lk/mtktwebslr/',
              imagepath: 'assets/sl railways.png',
              label: 'Sri Lankan Railways',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://busseat.lk/',
              imagepath: 'assets/bus seat.png',
              label: 'BusSeat.lk',
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://pickme.lk/',
              imagepath: 'assets/pick me.png',
              label: 'Pick Me',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://www.uber.com/lk/en/',
              imagepath: 'assets/uber.png',
              label: 'Uber',
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://sltb.eseat.lk/',
              imagepath: 'assets/eseat.png',
              label: 'eSeats.lk',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://www.busticket.lk/',
              imagepath: 'assets/bus ticket.png',
              label: 'BusTicket.lk',
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://www.bookaway.com/',
              imagepath: 'assets/bookaway.png',
              label: 'Bookaway.com',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://www.dialus.lk/',
              imagepath: 'assets/dialus.png',
              label: 'Dialus.lk',
            ),
          ],
        ),
      ],
    );
  }
}

class Train extends StatefulWidget {
  const Train({Key? key}) : super(key: key);

  @override
  _TrainState createState() => _TrainState();
}

class _TrainState extends State<Train> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://seatreservation.railway.gov.lk/mtktwebslr/',
              imagepath: 'assets/sl railways.png',
              label: 'Sri Lankan Railways',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://www.bookaway.com/',
              imagepath: 'assets/bookaway.png',
              label: 'Bookaway.com',
            ),
          ],
        ),
      ],
    );
  }
}

class Bus extends StatefulWidget {
  const Bus({Key? key}) : super(key: key);

  @override
  _BusState createState() => _BusState();
}

class _BusState extends State<Bus> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://sltb.eseat.lk/',
              imagepath: 'assets/eseat.png',
              label: 'eSeats.lk',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://www.busticket.lk/',
              imagepath: 'assets/bus ticket.png',
              label: 'BusTicket.lk',
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://busseat.lk/',
              imagepath: 'assets/bus seat.png',
              label: 'BusSeat.lk',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://www.bookaway.com/',
              imagepath: 'assets/bookaway.png',
              label: 'Bookaway.com',
            ),
          ],
        ),
      ],
    );
  }
}

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://pickme.lk/',
              imagepath: 'assets/pick me.png',
              label: 'Pick Me',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://www.uber.com/lk/en/',
              imagepath: 'assets/uber.png',
              label: 'Uber',
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://www.bookaway.com/',
              imagepath: 'assets/bookaway.png',
              label: 'Bookaway.com',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://www.dialus.lk/',
              imagepath: 'assets/dialus.png',
              label: 'Dialus.lk',
            ),
          ],
        ),
      ],
    );
  }
}

class Other extends StatefulWidget {
  const Other({Key? key}) : super(key: key);

  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vehicle(
              path: 'https://pickme.lk/',
              imagepath: 'assets/pick me.png',
              label: 'Pick Me',
            ),
            SizedBox(width: 5),
            vehicle(
              path: 'https://www.uber.com/lk/en/',
              imagepath: 'assets/uber.png',
              label: 'Uber',
            ),
          ],
        ),
      ],
    );
  }
}
