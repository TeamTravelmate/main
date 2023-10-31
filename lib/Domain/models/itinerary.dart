class Itinerary{
  List<ItineraryElements> itineraryElements;

  Itinerary({required this.itineraryElements});

  factory Itinerary.fromJson(Map<String, dynamic> json) {
    return Itinerary(
      itineraryElements: List<ItineraryElements>.from(
          json['newItinerary'].map((x) => ItineraryElements.fromJson(x))),
    );
  }
}

class ItineraryElements {
  int id;
  String day;
  String? location;
  String? activity;

  ItineraryElements(
      {required this.id,
      required this.day,
      this.location,
      this.activity});

  factory ItineraryElements.fromJson(Map<String, dynamic> json) {
    return ItineraryElements(
        id: json['id'],
        day: json['day'],
        location: json['location']['name'],
        activity: json['activity']['activity_name']);
  }
  
  Map<String, dynamic> toJson() => {
        'day': day,
        'location': location,
        'activity': activity,
      };
}
