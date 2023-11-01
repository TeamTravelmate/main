class Itinerary{
  List<ItineraryElements>? itineraryElements;

  Itinerary({this.itineraryElements});

  factory Itinerary.fromJson(Map<String, dynamic> json) {
    return Itinerary(
      itineraryElements: List<ItineraryElements>.from(
          json['newItinerary'].map((x) => ItineraryElements.fromJson(x))),
    );
  }

  //method that goes through the list of itinerary elements and returns a map for each day with a list of locations and activities seperated
  /**
   * {
   * day: 1,
   * locations: [location1, location2],
   * activities: [activity1, activity2]
   * },
   * {
   * day: 2,
   * locations: [location1, location2],
   * activities: [activity1, activity2]
   * }
   */
  //number of days comes from the trip provider
  Map<int, Map<String, List<String>>> getItineraryMap(int numberOfDays) {
    Map<int, Map<String, List<String>>> itineraryMap = {};
    for (int i = 1; i <= numberOfDays; i++) {
      Map<String, List<String>> dayMap = {};
      List<String> locations = [];
      List<String> activities = [];
      for (int j = 0; j < itineraryElements!.length; j++) {
        if (itineraryElements![j].day == i) {
          locations.add(itineraryElements![j].location!.split(',')[0]);
          activities.add(itineraryElements![j].activity!);
        }
      }
      dayMap['locations'] = locations;
      dayMap['activities'] = activities;
      itineraryMap[i] = dayMap;
    }
    return itineraryMap;
  }
}

class ItineraryElements {
  int? id;
  int? day;
  String? location;
  String? activity;

  ItineraryElements(
      {this.id,
      this.day,
      this.location,
      this.activity});

  factory ItineraryElements.fromJson(Map<String, dynamic> json) {
    return ItineraryElements(
      id: json['id'],
      day: int.parse(json['day']),
      location: json['location']['name'],
      activity: json['activity']['activity_name'],
    );
  }
  
  Map<String, dynamic> toJson() => {
        'day': day,
        'location': location,
        'activity': activity,
      };
}
