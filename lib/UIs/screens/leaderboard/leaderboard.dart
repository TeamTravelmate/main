import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/Domain/models/leaderboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../Data/env/env.dart';
import '../../themes/colors.dart';
import '../../widgets/side_drawer.dart';

// ignore: camel_case_types
class leaderboardController extends GetxController {
  var leaderboard = <Leaderboard>[].obs;

  void getPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    // response to get following
    var leaderboardResponse = await http.get(
      Uri.parse('$backendUrl/user/getPoints/'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (leaderboardResponse.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var jsonResponse = jsonDecode(leaderboardResponse.body);
      print('JSON Response: $jsonResponse');

      List<dynamic> jsonList = jsonResponse['leaders'] ?? [];
      leaderboard.value = Leaderboard.fromJsonList(jsonList);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final leaderboardController controller = Get.put(leaderboardController());

  @override
  void initState() {
    super.initState();
    controller.getPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            centerTitle: true,
            foregroundColor: ColorsTravelMate.primary,
            backgroundColor: ColorsTravelMate.tertiary,
            title: const Text(
              'Leaderboard',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: ColorsTravelMate.primary,
              ),
            ),
          ),
        ),
        body: Obx(() => ListView.builder(
            itemCount: controller.leaderboard.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: const Color.fromARGB(255, 249, 223, 170),
                      leading: Container(
                        width: 100,
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorsTravelMate.primary,
                              ),
                              alignment: Alignment.center,
                              child: const Image(
                                image: AssetImage('assets/img/crown.png'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://i.pravatar.cc/150?u=${controller.leaderboard[index].name ?? 'default'}'),
                                radius: 20),
                          ],
                        ),
                      ),
                      title: Text(controller.leaderboard[index].name ?? 'N/A',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: ColorsTravelMate.primary,
                          )),
                      subtitle: Row(
                        children: [
                          Text(
                            controller.leaderboard[index].points.toString() ??
                                'N/A',
                          ),
                          if (controller.leaderboard[index].points != null)
                            const Text(' points'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.hiking_outlined),
                        onPressed: () {},
                      )),
                );
              } else {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: const Color.fromARGB(255, 249, 223, 170),
                      leading: Container(
                        width: 100,
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 255, 172, 7),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsTravelMate.primary,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://i.pravatar.cc/150?u=${controller.leaderboard[index].name ?? 'default'}'),
                                radius: 20),
                          ],
                        ),
                      ),
                      title: Text(controller.leaderboard[index].name ?? 'N/A',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: ColorsTravelMate.primary,
                          )),
                      subtitle: Row(
                        children: [
                          Text(
                            controller.leaderboard[index].points.toString() ??
                                'N/A',
                          ),
                          if (controller.leaderboard[index].points != null)
                            const Text(' points'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.hiking_outlined),
                        onPressed: () {},
                      )),
                );
              }
            })));
  }
}
