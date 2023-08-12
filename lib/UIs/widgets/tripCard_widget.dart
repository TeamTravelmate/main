import 'package:flutter/material.dart';
import 'package:main/UIs/screens/map/map_todo.dart';
import '../themes/colors.dart';

// ignore: camel_case_types
class tripCard extends StatelessWidget {
  const tripCard({super.key,
  required this.tripLocationTitle,
  required this.location,
  required this.tripDuration,
  required this.tripmates,
  this.isMap = false,
  });

  //another constructor for the map button
  const tripCard.map({
    super.key,
    required this.tripLocationTitle,
    required this.location,
    required this.tripDuration,
    required this.tripmates,
    this.isMap = true,
  });


  final String tripLocationTitle;
  final String location;
  final String tripDuration;
  final String tripmates;
  final bool isMap;

  @override
  Widget build(BuildContext context) {
    var mapBtn = Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: FloatingActionButton.small(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MapToDoScreen()));
          },
          backgroundColor: ColorsTravelMate.tertiary,
          shape: const CircleBorder(
              side: BorderSide(color: ColorsTravelMate.primary)),
          child: const Icon(
            Icons.map_outlined,
            color: ColorsTravelMate.primary,
          )),
    );
    return Card(
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tripLocationTitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: ColorsTravelMate.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.favorite_border_rounded,
                    color: ColorsTravelMate.primary,
                  ),
                  Icon(
                    Icons.file_upload_outlined,
                    color: ColorsTravelMate.primary,
                  ),
                  Icon(
                    Icons.more_horiz_outlined,
                    color: ColorsTravelMate.primary,
                  ),
                ],
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 60),
                        child: const Icon(
                          Icons.location_on_rounded,
                          color: ColorsTravelMate.primary,
                        ),
                      ),
                      Text(
                        location,
                        style: const TextStyle(color: ColorsTravelMate.primary),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 60),
                        child: const Icon(
                          Icons.calendar_month,
                          color: ColorsTravelMate.primary,
                        ),
                      ),
                      Text(
                        tripDuration,
                        style: const TextStyle(color: ColorsTravelMate.primary),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 60),
                        child: const Icon(
                          Icons.supervised_user_circle_sharp,
                          color: ColorsTravelMate.primary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 60),
                        child: Image.asset(
                          'assets/profile.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Text(
                        tripmates,
                        style: const TextStyle(color: ColorsTravelMate.primary),
                      ),
                    ],
                  ),
                ],
              ),
              !isMap ? mapBtn : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
