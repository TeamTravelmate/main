import 'package:flutter/material.dart';
import 'package:main/Domain/models/places.dart';
import 'package:main/Domain/services/place_services.dart';
import '../../themes/colors.dart';

class CustomizeDestination extends StatefulWidget {
  late final PlaceServices placeServices;
  CustomizeDestination({super.key}) {
    placeServices = PlaceServices(
        filterType: 'tourist_attraction', searchedLocation: "6.9020,79.8611");
  }

  @override
  State<CustomizeDestination> createState() => _CustomizeDestinationState();
}

class _CustomizeDestinationState extends State<CustomizeDestination> {
  late Future<List<dynamic>> _places;

  @override
  void initState() {
    super.initState();
    _places = widget.placeServices.getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Places Nearby'),
          backgroundColor: ColorsTravelMate.tertiary,
          foregroundColor: ColorsTravelMate.primary,
        ),
        body: FutureBuilder<List<dynamic>>(
          future: _places,
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              List<Place> places =
                  snapshot.data!.map((e) => Place.fromJson(e)).toList();
              return ListView.builder(
                itemCount: places.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(
                      height: 50,
                      width: 50,
                      imagePath: widget.placeServices
                          .getPlaceImage(places[index].photoReference),
                      titleText: Text(places[index].name),
                      subtitleText: Text(places[index].address));
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.titleText,
    required this.subtitleText,
  });

  final double height;
  final double width;
  final Image imagePath;
  final Text titleText;
  final Text subtitleText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: SizedBox(
                child: SizedBox(
              height: height,
              width: width,
              child: imagePath,
            )),
            title: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: height,
                          width: width,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: ColorsTravelMate.tertiary,
                            child:
                                const Icon(Icons.favorite, color: Colors.red),
                          ),
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          height: height,
                          width: width,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: ColorsTravelMate.tertiary,
                            child: const Icon(
                              Icons.map_sharp,
                              color: ColorsTravelMate.secundary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          height: height,
                          width: width,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: ColorsTravelMate.tertiary,
                            child: const Icon(
                              Icons.add,
                              color: ColorsTravelMate.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    titleText,
                  ],
                )),
            subtitle: subtitleText,
          ),
        ],
      ),
    );
  }
}
