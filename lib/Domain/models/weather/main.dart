class Main {
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;
  num? seaLevel;
  num? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: num.tryParse(json['temp'].toString()),
        feelsLike: num.tryParse(json['feels_like'].toString()),
        tempMin: num.tryParse(json['temp_min'].toString()),
        tempMax: num.tryParse(json['temp_max'].toString()),
        pressure: num.tryParse(json['pressure'].toString()),
        humidity: num.tryParse(json['humidity'].toString()),
        seaLevel: num.tryParse(json['sea_level'].toString()),
        grndLevel: num.tryParse(json['grnd_level'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (temp != null) 'temp': temp,
        if (feelsLike != null) 'feels_like': feelsLike,
        if (tempMin != null) 'temp_min': tempMin,
        if (tempMax != null) 'temp_max': tempMax,
        if (pressure != null) 'pressure': pressure,
        if (humidity != null) 'humidity': humidity,
        if (seaLevel != null) 'sea_level': seaLevel,
        if (grndLevel != null) 'grnd_level': grndLevel,
      };
}
