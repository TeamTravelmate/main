class Place {
  String  name;
  String address;
  String photoReference;
  String iconUrl;
  // double rating;
  String placeId;

  Place({
    required this.name,
    required this.address,
    required this.photoReference,
    required this.iconUrl,
    // required this.rating,
    required this.placeId,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      address: json['vicinity'],
      iconUrl: json['icon'],
      // photoReference: json['photos'][0]['photo_reference'],
      //if photos key exist get the referance else set as ""
      photoReference: json.containsKey('photos') ? json['photos'][0]['photo_reference'] : "",
      // rating: json['rating'],
      placeId: json['place_id'],
    );
  }
  

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'iconUrl': iconUrl,
      'photoReferance': photoReference,
      // 'rating': rating,
      'placeId': placeId,
    };
  }
}