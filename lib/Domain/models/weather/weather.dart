import 'clouds.dart';
import 'coord.dart';
import 'main.dart';
import 'sys.dart';
import 'wind.dart';

class Weather {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  num? dt;
  Sys? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;

  Weather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        coord: json['coord'] == null
            ? null
            : Coord.fromJson(Map<String, dynamic>.from(json['coord'])),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        base: json['base']?.toString(),
        main: json['main'] == null
            ? null
            : Main.fromJson(Map<String, dynamic>.from(json['main'])),
        visibility: num.tryParse(json['visibility'].toString()),
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(Map<String, dynamic>.from(json['wind'])),
        clouds: json['clouds'] == null
            ? null
            : Clouds.fromJson(Map<String, dynamic>.from(json['clouds'])),
        dt: num.tryParse(json['dt'].toString()),
        sys: json['sys'] == null
            ? null
            : Sys.fromJson(Map<String, dynamic>.from(json['sys'])),
        timezone: num.tryParse(json['timezone'].toString()),
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        cod: num.tryParse(json['cod'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (coord != null) 'coord': coord?.toJson(),
        if (weather != null)
          'weather': weather?.map((e) => e.toJson()).toList(),
        if (base != null) 'base': base,
        if (main != null) 'main': main?.toJson(),
        if (visibility != null) 'visibility': visibility,
        if (wind != null) 'wind': wind?.toJson(),
        if (clouds != null) 'clouds': clouds?.toJson(),
        if (dt != null) 'dt': dt,
        if (sys != null) 'sys': sys?.toJson(),
        if (timezone != null) 'timezone': timezone,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (cod != null) 'cod': cod,
      };
}
