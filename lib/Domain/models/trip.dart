import 'package:intl/intl.dart';

class Trip {
  int? tripId;
  String? destination;
  String? startDate;
  String? startPlace;
  int? numberOfDays;
  int? childrenCount;
  int? adultCount;

  Trip({
    this.tripId,
    this.destination,
    this.startDate,
    this.startPlace,
    this.numberOfDays,
    this.childrenCount,
    this.adultCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': tripId,
      'destination': destination,
      'starting_date': startDate,
      'starting_place': startPlace,
      'no_of_days': numberOfDays,
      'children_count': childrenCount,
      'adult_count': adultCount,
    };
  }

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      tripId: json['id'],
      destination: json['destination'],
      startDate: parseDate(json['starting_date']),
      startPlace: json['starting_place'],
      numberOfDays: json['no_of_days'],
    );
  }

  Trip copyWith({
    int? tripId,
    String? destination,
    String? startDate,
    String? startPlace,
    int? numberOfDays,
    int? childrenCount,
    int? adultCount,
  }) {
    return Trip(
      tripId: tripId ?? this.tripId,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      startPlace: startPlace ?? this.startPlace,
      numberOfDays: numberOfDays ?? this.numberOfDays,
      childrenCount: childrenCount ?? this.childrenCount,
      adultCount: adultCount ?? this.adultCount,
    );
  }
}

String parseDate(String date) {
  var parsedDate = DateTime.parse(date);
  return DateFormat('EEE, M/d/y').format(parsedDate);
}