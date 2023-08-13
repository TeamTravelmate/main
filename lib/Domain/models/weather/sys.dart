class Sys {
  String? country;
  num? sunrise;
  num? sunset;

  Sys({this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        country: json['country']?.toString(),
        sunrise: num.tryParse(json['sunrise'].toString()),
        sunset: num.tryParse(json['sunset'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (country != null) 'country': country,
        if (sunrise != null) 'sunrise': sunrise,
        if (sunset != null) 'sunset': sunset,
      };
}
