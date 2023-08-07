import 'package:flutter/material.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/text_custom.dart';
import 'package:timelines/timelines.dart';

class TodoDayTile extends StatelessWidget {
  const TodoDayTile({
    super.key,
    required this.locations,
    required this.approxBudget,
    required this.weather,
    required this.displayDayMethod,
  });

  final String locations;
  final String approxBudget;
  final String weather;
  final void Function() displayDayMethod;

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
        IconButton(
          icon: Icon(Icons.arrow_forward_ios_outlined),
          color: ColorsTravelMate.primary,
          onPressed: displayDayMethod,
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
      padding: const EdgeInsets.fromLTRB(0,4,0,4),
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

class TripTimeline extends StatelessWidget {
  const TripTimeline({
    super.key,
    required this.sc,
    required this.displayDayMethod,
  });

  final ScrollController sc;
  final void Function() displayDayMethod;

  @override
  Widget build(BuildContext context) {
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
        itemCount: 3,
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
                key: Key("Day ${index + 1}"),
                locations: "Galle Face Green, Lotus tower, Floating market",
                approxBudget: "Rs. 5000",
                weather: "Sunny",
                // displayDayMethod: () => print(this.key),
                //print the key of the widget
                displayDayMethod: displayDayMethod, //print the day number of the widget
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
  });

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
            text: "Day 01",
            color: ColorsTravelMate.primary,
            fontSize: 20,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
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
