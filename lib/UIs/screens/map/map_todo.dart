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
            location: "Colombo, Sri Lanka",
            tripDuration: "Aug 20, 2023 - Aug 23, 2023",
            tripmates: "Kumar & 3 others",
          ),
        ),
        minHeight: MediaQuery.of(context).size.height / 6,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class MapSlidingPanel extends StatelessWidget {
  const MapSlidingPanel({
    super.key,
    required this.sc,
    required this.context,
  });

  final ScrollController sc;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Timeline.tileBuilder(
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
            indicatorBuilder: (_, index) => const DotIndicator(
              size: 20,
              color: ColorsTravelMate.primary,
            ),
            connectorBuilder: (_, index, ___) => const SolidLineConnector(
              color: ColorsTravelMate.secundary,
            ),
            oppositeContentsBuilder: (_, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextCustom(
                text: "Day ${index + 1}",
                color: ColorsTravelMate.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            contentsBuilder: (_, index) => SizedBox(
              width: MediaQuery.of(context).size.width / 1.25,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: const TodoDayTile(
                      locations: "Galle Face Green, Lotus tower, Floating market",
                      approxBudget: "Rs. 5000",
                      weather: "Sunny",
                    ),
                    onTap: () {
                      print("Day ${index + 1} tapped");
                    },
                  )),
            ),
          ),
        ),
      );
  }
}
