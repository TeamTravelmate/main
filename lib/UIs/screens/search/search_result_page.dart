import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/Data/controller/search_result_controller.dart';


class SearchResultsPage extends StatelessWidget {
  final String query;
  final SearchResultsController controller = Get.put(SearchResultsController());

  SearchResultsPage({required this.query});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Results'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Users'),
              Tab(text: 'Places'),
              Tab(text: 'Activities'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildResultsTab('Users', controller.userResults),
            buildResultsTab('Places', controller.placeResults),
            buildResultsTab('Activities', controller.activityResults),
          ],
        ),
      ),
    );
  }

  Widget buildResultsTab(String category, RxList results) {
    return Obx(() {
      return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          if (category == 'Users') {
            final user = results[index];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              // Add other user-specific information.
            );
          } else if (category == 'Places') {
            final place = results[index];
            return ListTile(
              title: Text(place.name),
              subtitle: Text(place.name), // Check if this should be 'address' or another property.
              // Add other place-specific information.
            );
          } else if (category == 'Activities') {
            final activity = results[index];
            return ListTile(
              title: Text(activity.name),
              subtitle: Text(activity.description),
              // Add other activity-specific information.
            );
          }
          return SizedBox.shrink(); // Return an empty container if the category doesn't match.
        },
      );
    });
  }
}
