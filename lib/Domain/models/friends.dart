class User {
  final int? id;
  final String? name;
  final String? email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
   return jsonList.map((user) => User.fromJson(user)).toList();
  }
}