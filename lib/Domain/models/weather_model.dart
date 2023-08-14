class weather {
  var city;
  var icon;
  var condition;
  var temp_c;
  var wind_kph;
  var humidity;
  var wind_dir;
  var gust_kph;
  var uv;
  var pressure_mb;
  var cloud;
  var feelslike_c;
  var wind_degree;

  weather(
      {this.city,
      this.icon,
      this.condition,
      this.temp_c,
      this.wind_kph,
      this.humidity,
      this.wind_dir,
      this.gust_kph,
      this.uv,
      this.pressure_mb,
      var cloud,
      var feelslike_c,
      var wind_degree
      });

  weather.fromJson(Map<String, dynamic> json) {
    city = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp_c = json['current']['temp_c'];
    wind_kph = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    wind_dir = json['current']['wind_dir'];
    gust_kph = json['current']['gust_kph'];
    uv = json['current']['uv'];
    pressure_mb = json['current']['pressure_mb'];
    cloud = json['current']['cloud'];
    feelslike_c = json['current']['feelslike_c'];
    wind_degree = json['current']['wind_degree'];
  }
}
