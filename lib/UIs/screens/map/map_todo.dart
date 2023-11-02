import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main/Domain/provider/budget_provider.dart';
import 'package:main/Domain/provider/itinerary_provider.dart';
import 'package:main/Domain/provider/mapCoordinates_provider.dart';
import 'package:main/Domain/provider/trip_provider.dart';
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
  const MapToDoScreen({super.key});

  @override
  State<MapToDoScreen> createState() => _MapToDoScreenState();
}

class _MapToDoScreenState extends State<MapToDoScreen> {
  var tripModel = Trip(
      tripId: 1,
      name: "Colombo",
      description: "Capital of Sri Lanka",
      image: 'assets/images/colombo.jpg');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        body: CustomMap(), //replace this with CustomMap() to view map
        panelBuilder: (sc) => MapSlidingPanel(
          sc: sc,
          context: context,
        ),
        collapsed: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorsTravelMate.primary,
                ),
                width: MediaQuery.of(context).size.width / 10,
                height: 4,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: ColorsTravelMate.tertiary,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  final tripProvider = ref.read(tripPlanningNotifierProvider);
                  return tripCard.map(
                    tripLocationTitle:
                        "Trip to ${tripProvider.value!.destination != null ? tripProvider.value!.destination!.split(',')[0] : "Somewhere"}",
                    location: tripProvider.value!.destination ?? "Somewhere",
                    tripDuration:
                        "${tripProvider.value!.startDate} - ${tripProvider.value!.numberOfDays.toString()} days",
                    tripmates: "",
                  );
                },
              ),
            ),
          ],
        ),
        minHeight: MediaQuery.of(context).size.height / 4,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class MapSlidingPanel extends ConsumerStatefulWidget {
  const MapSlidingPanel({
    super.key,
    required this.sc,
    required this.context,
  });

  final ScrollController sc;
  final BuildContext context;

  @override
  ConsumerState<MapSlidingPanel> createState() => _MapSlidingPanelState();
}

class _MapSlidingPanelState extends ConsumerState<MapSlidingPanel> {
  bool _isExpanded = false;
  Map<String, dynamic>? tripDay;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _isExpanded
                ? TripDayView(
                    day: tripDay!['day'],
                    locations: "Places to visit ${tripDay!['locations'].map((e) => e.split(',')[0])}",
                    approxBudget: "${tripDay!['approxBudget']}",
                    weather: "Weather: ${tripDay!['weather']}",
                    backMethod: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  )
                : TripTimeline(
                    sc: widget.sc,
                    displayDayMethod: _expandDayView,
                    tripDays: ref.read(itineraryNotifierProvider).value!,
                    budget: ref
                        .read(budgetNotifierProvider(ref
                            .read(tripPlanningNotifierProvider)
                            .value!
                            .tripId))
                        .value!,
                  ));
      },
    );
  }

  void _expandDayView(Map<String, dynamic> tripDay) {
    setState(() {
      _isExpanded = !_isExpanded;
      this.tripDay = tripDay;
    });
  }
}
