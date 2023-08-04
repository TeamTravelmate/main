import 'package:main/UIs/widgets/text_custom.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class MapToDoScreen extends StatelessWidget {
  const MapToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Map")),
      ),
      body: SlidingUpPanel(
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
            )
          ],
        ),
        header: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextCustom(
                      text: "Trip To Galle",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width / 12,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit,
                            size: MediaQuery.of(context).size.width / 20)),
                  ],
                ),
                //icon for a heart
                Row(
                  //align the icons to the right
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          size: MediaQuery.of(context).size.width / 20,
                          color: Colors.red,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.ios_share_rounded,
                            size: MediaQuery.of(context).size.width / 20)),
                  ],
                ),
              ],
            ),
          ),
        ),
        panel: Center(child: Text("ToDo List")),
        collapsed: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 50),
                            child: Icon(
                              Icons.location_on_outlined,
                              size: MediaQuery.of(context).size.width / 25,
                              color: Colors.black,
                            ),
                          ),
                          TextCustom(
                            text: "Galle Fort, Unawatuna Beach",
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 25,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 50),
                            child: Icon(
                              Icons.calendar_today_outlined,
                              size: MediaQuery.of(context).size.width / 25,
                              color: Colors.black,
                            ),
                          ),
                          TextCustom(
                            text: "July 3, 2023  - July 6, 2023 (3 days)",
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 25,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 50),
                            child: Icon(
                              Icons.account_circle_outlined,
                              size: MediaQuery.of(context).size.width / 25,
                              color: Colors.black,
                            ),
                          ),
                          TextCustom(
                            text: "3",
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width / 25,
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.keyboard_arrow_up_outlined)),
          ],
        ),
        minHeight: MediaQuery.of(context).size.height / 6,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
