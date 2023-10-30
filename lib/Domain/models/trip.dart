import 'package:intl/intl.dart';

class Trip {
  int? tripId;
  String? destination;
  String? startDate;
  int? numberOfDays;
  int? childrenCount;
  int? adultCount;

  Trip({
    this.tripId,
    this.destination,
    this.startDate,
    this.numberOfDays,
    this.childrenCount,
    this.adultCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': tripId,
      'destination': destination,
      'startDate': startDate,
      'numberOfDays': numberOfDays,
      'childrenCount': childrenCount,
      'adultCount': adultCount,
    };
  }

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      tripId: json['id'],
      destination: json['starting_place'],
      startDate: parseDate(json['starting_date']),
      numberOfDays: json['no_of_days'],
    );
  }
}

String parseDate(String date) {
  var parsedDate = DateTime.parse(date);
  return DateFormat('EEE, M/d/y').format(parsedDate);
}