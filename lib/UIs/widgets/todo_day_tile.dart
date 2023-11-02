import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:main/Domain/models/budget.dart';
import 'package:main/Domain/models/itinerary.dart';
import 'package:main/Domain/provider/mapCoordinates_provider.dart';
import 'package:main/Domain/provider/trip_provider.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/text_custom.dart';
import 'package:timelines/timelines.dart';

import '../../Domain/models/tripLuq.dart';

class TodoDayTile extends StatelessWidget {
  const TodoDayTile({
    super.key,
    required this.locations,
    required this.approxBudget,
    required this.weather,
    required this.displayDayMethod,
    required this.day,
  });

  final List<String> locations;
  final String approxBudget;
  final String weather;
  final int day;
  final void Function(Map<String, dynamic> tripDay) displayDayMethod;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconWithText(
                text: locations
                    .toString()
                    .replaceAll("[", "")
                    .replaceAll("]", ""),
                icon: Icons.location_on_outlined,
              ),
              IconWithText(
                text: approxBudget,
                icon: Icons.attach_money_outlined,
              ),
              IconWithText(
                text: weather,
                icon: Icons.wb_sunny_outlined,
              ),
            ],
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            return IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              color: ColorsTravelMate.primary,
              onPressed: () {
                if(locations.length>0){
                  ref
                    .read(mapCoordinatesNotifierProvider.notifier)
                    .newCoordinates(locations);
                }
                displayDayMethod({
                  'day': day,
                  'locations': locations,
                  'approxBudget': approxBudget,
                  'weather': weather,
                });
              },
            );
          },
        ),
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Icon(
              icon,
              color: ColorsTravelMate.primary,
            ),
          ),
          Expanded(
            child: TextCustom(
              text: this.text,
              color: ColorsTravelMate.primary,
              fontSize: 15,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class TripTimeline extends ConsumerWidget {
  const TripTimeline({
    super.key,
    required this.sc,
    required this.displayDayMethod,
    required this.tripDays,
    required this.budget,
  });

  final ScrollController sc;
  final Itinerary tripDays;
  final Budget budget;
  final void Function(Map<String, dynamic> tripDay) displayDayMethod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripProvider = ref.read(tripPlanningNotifierProvider);
    final itinerayMap =
        tripDays.getItineraryMap(tripProvider.value!.numberOfDays!);
    final startDateString = tripProvider.value!.startDate!;
    final startDate = DateFormat('EEE, MM/dd/yyyy').parse(startDateString);
    final dayTotals =
        budget.getBudgetMap(tripProvider.value!.numberOfDays!, startDate);
    return Timeline.tileBuilder(
      controller: sc,
      theme: TimelineThemeData(
        color: ColorsTravelMate.primary,
        nodePosition: 0.2,
        connectorTheme: const ConnectorThemeData(
          thickness: 2.5,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.after,
        itemCount: tripProvider.value!.numberOfDays!,
        indicatorBuilder: (_, index) => OutlinedDotIndicator(
          key: Key("Day ${index + 1}"),
          size: 20,
          color: ColorsTravelMate.primary,
        ),
        connectorBuilder: (_, index, ___) => SolidLineConnector(
          key: Key("Day ${index + 1}"),
          color: ColorsTravelMate.secundary,
        ),
        oppositeContentsBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextCustom(
            text: "Day ${index + 1}",
            color: ColorsTravelMate.primary,
            fontSize: 20,
          ),
        ),
        contentsBuilder: (_, index) => SizedBox(
          width: MediaQuery.of(context).size.width / 1.25,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TodoDayTile(
                day: index + 1,
                key: Key("Day ${index + 1}"),
                locations: itinerayMap[index + 1]!['locations']!,
                approxBudget: "Rs. ${dayTotals[index + 1]}",
                weather: "",
                displayDayMethod:
                    displayDayMethod, //print the day number of the widget
              )),
        ),
      ),
    );
  }
}

class TripDayView extends StatelessWidget {
  const TripDayView({
    super.key,
    required this.locations,
    required this.approxBudget,
    required this.weather,
    required this.backMethod,
    required this.day,
  });

  final int day;
  final String locations;
  final String approxBudget;
  final String weather;
  final void Function() backMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: IconButton(
            onPressed: backMethod,
            icon: Icon(Icons.arrow_back_ios_outlined),
            color: ColorsTravelMate.primary,
          ),
          title: TextCustom(
            text: "Day $day",
            color: ColorsTravelMate.primary,
            fontSize: 20,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconWithText(
                    text: locations,
                    icon: Icons.location_on_outlined,
                  ),
                  IconWithText(
                    text: approxBudget,
                    icon: Icons.attach_money_outlined,
                  ),
                  IconWithText(
                    text: weather,
                    icon: Icons.wb_sunny_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
