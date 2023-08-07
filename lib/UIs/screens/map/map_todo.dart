import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/text_custom.dart';
import 'package:main/UIs/widgets/todo_day_tile.dart';
import 'package:main/UIs/widgets/top_back_btn.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../widgets/tripCard_widget.dart';

class MapToDoScreen extends StatelessWidget {
  const MapToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        body: FlutterMap(
          options: MapOptions(
            center: const LatLng(6.9020, 79.8611),
            zoom: 14.0,
            minZoom: 10,
            maxZoom: 18,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: "flutter_map",
            ),
            //floating back button in the top left corner
            const TopBackBtn(),
          ],
        ),
        panelBuilder: (sc) => MapSlidingPanel(sc: sc, context: context),
        collapsed: Container(
          decoration: const BoxDecoration(
            color: ColorsTravelMate.tertiary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: const tripCard.map(
            tripLocationTitle: "Colombo",
            location: "Sri Lanka",
            tripDuration: "3 days",
            tripmates: "3",
          ),
        ),
        minHeight: MediaQuery.of(context).size.height / 6,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class MapSlidingPanel extends StatefulWidget {
  const MapSlidingPanel({
    super.key,
    required this.sc,
    required this.context,
  });

  final ScrollController sc;
  final BuildContext context;

  @override
  State<MapSlidingPanel> createState() => _MapSlidingPanelState();
}

class _MapSlidingPanelState extends State<MapSlidingPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: _isExpanded
        ?TripDayView(locations: "Galle Face Green, Lotus tower, Floating market", approxBudget: "Rs. 5000", weather: "Rainy", backMethod: _expandDayView,)
        :TripTimeline(sc: widget.sc, displayDayMethod: _expandDayView,)
      );
  }

  void _expandDayView() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
