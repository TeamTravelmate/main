import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/map_widget.dart';
import 'package:main/UIs/widgets/todo_day_tile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';

import '../../widgets/tripCard_widget.dart';

class MapToDoScreen extends StatefulWidget {
  const MapToDoScreen({super.key});

  @override
  State<MapToDoScreen> createState() => _MapToDoScreenState();
}

class _MapToDoScreenState extends State<MapToDoScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        body: CustomMap(),
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
