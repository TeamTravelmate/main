class User {
  final String? name;
  final String? username;

  User({required this.name, required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      username: json['username'],
    );
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
   return jsonList.map((user) => User.fromJson(user)).toList();
  }
}

class Location {
 final String? name;
 final String? city;

 Location({required this.name, required this.city});

 factory Location.fromJson(Map<String, dynamic> json) {
  return Location(
    name: json['name'],
    city: json['city'],
  );
 }

 static List<Location> fromJsonList(List<dynamic> jsonList) {
  return jsonList.map((location) => Location.fromJson(location)).toList();
 }
}

class Activity {
 final String? name;
 final String? city;

 Activity({required this.name, required this.city});

 factory Activity.fromJson(Map<String, dynamic> json) {
  return Activity(
    name: json['activity_name'],
    city: json['location']['name'],
  );
 }

 static List<Activity> fromJsonList(List<dynamic> jsonList) {
  return jsonList.map((activity) => Activity.fromJson(activity)).toList();
 }
}
