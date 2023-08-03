import 'package:flutter/material.dart';
import '../../themes/colors.dart';
// import 'dart:js' as js;

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
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 132, 201, 209),
                        foregroundColor: ColorsTravelMate.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Train',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 132, 201, 209),
                        foregroundColor: ColorsTravelMate.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Bus',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 132, 201, 209),
                        foregroundColor: ColorsTravelMate.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Car',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 132, 201, 209),
                        foregroundColor: ColorsTravelMate.tertiary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Van',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  vehicle(
                    imagepath: 'assets/sl railways.png',
                    label: 'Sri Lankan Railways',
                  ),
                  SizedBox(width: 5),
                  vehicle(
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
                    imagepath: 'assets/pick me.png',
                    label: 'Pick Me',
                  ),
                  SizedBox(width: 5),
                  vehicle(
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
                    imagepath: 'assets/eseat.png',
                    label: 'eSeats.lk',
                  ),
                  SizedBox(width: 5),
                  vehicle(
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
                    imagepath: 'assets/bookaway.png',
                    label: 'Bookaway.com',
                  ),
                  SizedBox(width: 5),
                  vehicle(
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
  });

  final String imagepath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 150,
      child: ElevatedButton(
          onPressed: () {
            // js.context.callMethod('open', ['https:/google.com/','_self']);
          },
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
}
