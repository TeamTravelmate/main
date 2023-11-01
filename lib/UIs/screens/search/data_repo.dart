import 'package:main/Domain/models/user.dart';
import 'package:main/UIs/screens/search/mock_data.dart';

class UserRepository {
  List<User> getUsers(String query) {
    return mockUsers.where((user) => user.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}

class PlaceRepository {
  List<Place> getPlaces(String query) {
    return mockPlaces.where((place) => place.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}

class LocationRepository {
  List<Location> getLocations(String query) {
    return mockLocations.where((location) => location.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}

class ActivityRepository {
  List<Activity> getActivities(String query) {
    return mockActivities.where((activity) => activity.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}

class ProductRepository {
  List<Product> getProducts(String query) {
    return mockProducts.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
