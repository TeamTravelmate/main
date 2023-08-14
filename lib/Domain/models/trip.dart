class Trip {
  final int userId;
  final String destination;
  final String startDate;
  final int numberOfDays;

  Trip({
    required this.userId,
    required this.destination,
    required this.startDate,
    required this.numberOfDays,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'destination': destination,
      'startDate': startDate,
      'numberOfDays': numberOfDays,
    };
  }
}