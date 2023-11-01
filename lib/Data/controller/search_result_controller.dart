import 'package:get/get.dart';
import 'package:main/Domain/models/activity.dart';
import 'package:main/Domain/models/places.dart';
import 'package:main/Domain/models/user.dart';

class SearchResultsController extends GetxController {
  RxList<User> userResults = <User>[].obs;
  RxList<Place> placeResults = <Place>[].obs;
  RxList<Activity> activityResults = <Activity>[].obs;

  void fetchResults(String query) {
    // Fetch and update userResults, placeResults, and activityResults.
    userResults.assignAll(fetchUserResults(query));
    placeResults.assignAll(fetchPlaceResults(query));
    activityResults.assignAll(fetchActivityResults(query));
  }
}

  List<User> fetchUserResults(String query) {
    // Fetch and filter user data based on the query.
    // Return a list of User objects.
    return [
      User(avatar: 'user1.jpg', name: 'John Doe', email: 'john@example.com'),
      User(avatar: 'user2.jpg', name: 'Jane Smith', email: 'jane@example.com'),
      // Add more user data based on the query.
    ];
  }

    List<Place> fetchPlaceResults(String query) {
    // Fetch and filter place data based on the query.
    // Return a list of Place objects.
    return [
      Place(placeId: '1', name: 'Park', photoReference: 'park.jpg', address: 'galle', iconUrl: 'url'),
      Place(placeId: '2', name: 'Museum', photoReference: 'museum.jpg', address: 'galle', iconUrl: 'url'),
      // Add more place data based on the query.
    ];
  }

  List<Activity> fetchActivityResults(String query) {
    // Fetch and filter activity data based on the query.
    // Return a list of Activity objects.
    return [
      Activity(id: 1, name: 'Hiking', description: 'Explore nature trails', imageUrl: 'hiking.jpg'),
      Activity(id: 2, name: 'Swimming', description: 'Cool off in the pool', imageUrl: 'swimming.jpg'),
      // Add more activity data based on the query.
    ];
  }
