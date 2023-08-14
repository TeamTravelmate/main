import 'package:flutter/material.dart';
import 'package:main/Domain/models/places.dart';
import 'package:main/Domain/services/place_services.dart';
import '../../themes/colors.dart';

class CustomizeResturants extends StatefulWidget {
  late final PlaceServices placeServices;
  CustomizeResturants({super.key}) {
    placeServices = PlaceServices(
        filterType: 'restaurant', searchedLocation: "6.9020,79.8611");
  }

  @override
  State<CustomizeResturants> createState() => _CustomizeResturantsState();
}

class _CustomizeResturantsState extends State<CustomizeResturants> {
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
          title: const Text('Restaurants'),
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
                  return RestaurantCard(place: places[index], placePhoto: widget.placeServices.getPlaceImage(places[index].photoReference));
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

class RestaurantCard extends StatelessWidget {
  final Place place;
  final Image placePhoto;
  const RestaurantCard({super.key, required this.place, required this.placePhoto});

  @override
  Widget build(BuildContext context) {
    var iconButton = IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
      );
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          width: 50,
          child: placePhoto,
        ),
      ),
      title: Text(place.name),
      subtitle: Text(place.address),
      trailing: iconButton,
    );
  }
}
