import 'dart:convert';

WeatherCityModel weatherFromJson(String str) => WeatherCityModel.fromJson(
  json.decode(str)
);

class WeatherCityModel {
  List<Weather>? weather;
  Main? main;
  Sys? sys;
  String? name;
  WeatherCityModel({
    this.weather,
    this.main,
    this.sys,
    this.name,
  });

  factory WeatherCityModel.fromJson(Map<String, dynamic> json) =>
      WeatherCityModel(
        weather: List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json['main']),
        sys: Sys.fromJson(json['sys']),
        name: json['name'],
      );
}

class Weather {
  late int? id;
  late String? main;
  late String? description;
  late String? icon;
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json['id'],
    main: json['main'],
    description: json['description'],
    icon: json['icon'],
  );
}

class Main {
  late double? temp;
  late double? feelsLike;
  late double? tempMin;
  late double? tempMax;
  late int? pressure;
  late int? humidity;
  late int? seaLevel;
  late int? grndLevel;
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
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
      );
}
class Sys {
  late int? type;
  late int? id;
  late String? country;
  late int? sunrise;
  late int? sunset;
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"],
        id: json["id"],
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );
}
