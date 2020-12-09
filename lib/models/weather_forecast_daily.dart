class WeatherForecastLocation {
  City city;

  WeatherForecastLocation({this.city});

  WeatherForecastLocation.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    return data;
  }
}

class City {
  String name;
  String country;

  City({
    this.name,
    this.country,
  });

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['country'] = this.country;
    return data;
  }
}
