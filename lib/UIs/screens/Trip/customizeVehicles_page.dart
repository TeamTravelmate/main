import 'package:flutter/material.dart';
import '../../themes/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomizeVehicle extends StatelessWidget {
  const CustomizeVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Options'),
        backgroundColor: ColorsTravelMate.tertiary,
        foregroundColor: ColorsTravelMate.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsTravelMate.secundary,
                        foregroundColor: ColorsTravelMate.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'All',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const TypeTag(type: 'Train'),
                  const SizedBox(width: 10),
                  const TypeTag(type: 'Bus'),
                  const SizedBox(width: 10),
                  const TypeTag(type: 'Car'),
                  const SizedBox(width: 10),
                  const TypeTag(type: 'Van'),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
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
              const SizedBox(height: 15),
              const Row(
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
              const SizedBox(height: 15),
              const Row(
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
              const SizedBox(height: 15),
              const Row(
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
          ),
        ),
      ),
    );
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

class TypeTag extends StatelessWidget {
  const TypeTag({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 132, 201, 209),
          foregroundColor: ColorsTravelMate.tertiary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          type,
        ),
      ),
    );
  }
}
