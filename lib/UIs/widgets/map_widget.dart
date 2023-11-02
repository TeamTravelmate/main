import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:main/Domain/provider/mapCoordinates_provider.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});
  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late GoogleMapController mapController;
  late String _mapStyle;
  late double _mapBottomPadding;

  final LatLng _center = const LatLng(6.9020, 79.8611);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(_mapStyle);
  }

  @override
  void initState() {
    super.initState();
    //MediaQuery.of(context).size.height / 6
    _mapBottomPadding = 100;
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final coordinates = ref.watch(mapCoordinatesNotifierProvider);
        return coordinates.when(
          data: (data) {
            //make the set of markers by iterating through the list of coordinates
            final Set<Marker> _markers = {};
            for (int i = 0; i < data.length; i++) {
              
              _markers.add(
                Marker(
                  markerId: MarkerId(data[i]['address']),
                  position: LatLng(data[i]['lat']!, data[i]['lng']!),
                  infoWindow: InfoWindow(title: data[i]['address']),
                ),
              );
            }
            return GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(_markers.first.position.latitude,
                    _markers.first.position.longitude),
                zoom: 11.0,
              ),
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              padding: EdgeInsets.only(bottom: _mapBottomPadding),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Text('Error: $error'),
        );
      },
    );
  }
}
