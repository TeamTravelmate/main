class Coord {
  num? lon;
  num? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: num.tryParse(json['lon'].toString()),
        lat: num.tryParse(json['lat'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (lon != null) 'lon': lon,
        if (lat != null) 'lat': lat,
      };
}
