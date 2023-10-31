class Activity {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Activity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}