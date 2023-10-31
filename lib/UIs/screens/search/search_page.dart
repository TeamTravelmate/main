import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/side_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:main/Domain/models/search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/env/env.dart';

class SearchController extends GetxController {
  var users = <User>[].obs;
  var locations = <Location>[].obs;
  var activities = <Activity>[].obs;

  void searchUsers(String userQuery) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var response = await http.get(
      Uri.parse('$backendUrl/search/?userQuery=$userQuery'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      var jsonResponse = jsonDecode(response.body);
      print('JSON Response: $jsonResponse');

      List<dynamic> jsonList = jsonResponse['user'] ?? [];
      users.value = User.fromJsonList(jsonList);

      List<dynamic> locationsJsonList = jsonResponse['locations'] ?? [];
      locations.value = Location.fromJsonList(locationsJsonList);

      List<dynamic> activitiesJsonList = jsonResponse['activities'] ?? [];
      activities.value = Activity.fromJsonList(activitiesJsonList);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }
}

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            foregroundColor: ColorsTravelMate.primary,
            backgroundColor: ColorsTravelMate.tertiary,
            title: SizedBox(
              height: 45,
              width: 300,
              child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  controller.searchUsers(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: ColorsTravelMate.primary,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: ColorsTravelMate.primary,
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: ColorsTravelMate.primary,
                      width: 1,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
              ),
            ),
          ),
        ),
        body: Obx(() => ListView.builder(
              itemCount: controller.users.length +
                  controller.locations.length +
                  controller.activities.length,
              itemBuilder: ((context, index) {
                if (index < controller.users.length) {
                  return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(controller.users[index].name ?? 'N/A'),
                      subtitle: Text(controller.users[index].username ?? 'N/A'),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          if (controller.users.isNotEmpty &&
                              index < controller.users.length) {
                            setState(() {
                              controller.users.removeAt(index);
                            });
                          }
                        },
                      ));
                } else if (index <
                    controller.users.length + controller.locations.length) {
                  int locationIndex = index - controller.users.length;
                  return ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(
                          controller.locations[locationIndex].name ?? 'N/A'),
                      subtitle: Text(
                          controller.locations[locationIndex].city ?? 'N/A'),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          if (controller.locations.isNotEmpty &&
                              locationIndex < controller.locations.length) {
                            setState(() {
                              controller.locations.removeAt(locationIndex);
                            });
                          }
                        },
                      ));
                } else {
                  int activityIndex = index -
                      controller.users.length -
                      controller.locations.length;
                  return ListTile(
                      leading: const Icon(Icons.local_activity_outlined),
                      title: Text(
                          controller.activities[activityIndex].name ?? 'N/A'),
                      subtitle: Text(
                          controller.activities[activityIndex].city ?? 'N/A'),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          if (controller.activities.isNotEmpty &&
                              activityIndex < controller.activities.length) {
                            setState(() {
                              controller.activities.removeAt(activityIndex);
                            });
                          }
                        },
                      ));
                }
              }),
            )));
  }
}
