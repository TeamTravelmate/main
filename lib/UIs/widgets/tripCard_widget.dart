import 'package:flutter/material.dart';
import '../themes/colors.dart';

// ignore: camel_case_types
class tripCard extends StatelessWidget {
  const tripCard({super.key,
  required this.tripLocationTitle,
  required this.location,
  required this.tripDuration,
  required this.tripmates,
  });

  final String tripLocationTitle;
  final String location;
  final String tripDuration;
  final String tripmates;

  @override
  Widget build(BuildContext context) {
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
                      const Icon(
                        Icons.location_on_rounded,
                        color: ColorsTravelMate.primary,
                      ),
                      Text(
                        location,
                        style: const TextStyle(color: ColorsTravelMate.primary),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: ColorsTravelMate.primary,
                      ),
                      Text(
                        tripDuration,
                        style: const TextStyle(color: ColorsTravelMate.primary),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.supervised_user_circle_sharp,
                        color: ColorsTravelMate.primary,
                      ),
                      Image.asset(
                        'assets/profile.png',
                        width: 20,
                        height: 20,
                      ),
                      Text(
                        tripmates,
                        style: const TextStyle(color: ColorsTravelMate.primary),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: FloatingActionButton.small(
                    onPressed: () {},
                    backgroundColor: ColorsTravelMate.tertiary,
                    shape: const CircleBorder(
                        side: BorderSide(color: ColorsTravelMate.primary)),
                    child: const Icon(
                      Icons.map_outlined,
                      color: ColorsTravelMate.primary,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}