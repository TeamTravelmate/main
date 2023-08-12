class Wind {
  num? speed;
  num? deg;
  num? gust;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: num.tryParse(json['speed'].toString()),
        deg: num.tryParse(json['deg'].toString()),
        gust: num.tryParse(json['gust'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (speed != null) 'speed': speed,
        if (deg != null) 'deg': deg,
        if (gust != null) 'gust': gust,
      };
}
