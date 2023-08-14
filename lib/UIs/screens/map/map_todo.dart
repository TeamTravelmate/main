import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/map_widget.dart';
import 'package:main/UIs/widgets/todo_day_tile.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';

import '../../../Domain/models/tripLuq.dart';
import '../../../Domain/models/user.dart';
import 'package:timelines/timelines.dart';
import '../../widgets/tripCard_widget.dart';

class MapToDoScreen extends StatefulWidget {
  final int tripId;

  const MapToDoScreen({super.key, required this.tripId});

  @override
  State<MapToDoScreen> createState() => _MapToDoScreenState();
}

class _MapToDoScreenState extends State<MapToDoScreen> {
  var tripModel = Trip(tripId: 1, name: "Colombo", description: "Capital of Sri Lanka", image: 'assets/images/colombo.jpg');
  List<TripDay> _tripDays = [];
  List<User> _friends = [];

  @override
  void initState() {
    super.initState();
    tripModel.getDays().then((value) => {
      setState(() {
        _tripDays = tripModel.getDaysList();
      })
    });
    tripModel.getTripMates("").then((value) => {
      setState(() {
        _friends = tripModel.getTripMatesList();
      })
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        body: CustomMap(), //replace this with CustomMap() to view map
        panelBuilder: (sc) => MapSlidingPanel(sc: sc, context: context, tripDays: _tripDays,),
        collapsed: Container(
          decoration: const BoxDecoration(
            color: ColorsTravelMate.tertiary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: tripCard.map(
            tripLocationTitle: tripModel.name,
            location: tripModel.description,
            tripDuration: _tripDays.length.toString(),
            tripmates: _friends.length.toString(),
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
    required this.tripDays,
  });

  final ScrollController sc;
  final BuildContext context;
  final List<TripDay> tripDays;

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
        :TripTimeline(sc: widget.sc, displayDayMethod: _expandDayView, tripDays: widget.tripDays,)
      );
  }

  void _expandDayView() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
