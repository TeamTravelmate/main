class Trip {
  final int tripId;
  final String destination;
  final String startDate;
  final int numberOfDays;

  Trip({
    required this.tripId,
    required this.destination,
    required this.startDate,
    required this.numberOfDays,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': tripId,
      'destination': destination,
      'startDate': startDate,
      'numberOfDays': numberOfDays,
    };
  }

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      tripId: json['id'],
      destination: json['startingPlace'],
      startDate: json['starting_date'],
      numberOfDays: json['numberOfDays'],
    );
  } 
}