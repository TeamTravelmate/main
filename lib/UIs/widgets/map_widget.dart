import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

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
  Widget build(BuildContext context) {
    return GoogleMap(
      padding: EdgeInsets.only(bottom: (MediaQuery.of(context).size.height / 3)),
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 14.0,
      ),
    );
  }
}
