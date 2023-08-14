class Clouds {
  num? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: num.tryParse(json['all'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (all != null) 'all': all,
      };
}
