class Leaderboard {
  final int? id;
  final String? name;
  final int? points;
  final String? count;

  Leaderboard({
    required this.id,
    required this.name,
    required this.points,
    required this.count,
  });

  factory Leaderboard.fromJson(Map<String, dynamic> json) {
    return Leaderboard(
      id: int.parse(json['user_id'].toString()),
      name: json['name'],
      points: int.parse(json['points'].toString()),
      count: json['trips'],
    );
  }

  static List<Leaderboard> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((user) => Leaderboard.fromJson(user)).toList();
  }
}

