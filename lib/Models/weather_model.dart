import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String? image;
  final String date;
  final String wetherCondition;

  WeatherModel(
      {required this.cityName,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.image,
      required this.date,
      required this.wetherCondition});
  factory  WeatherModel.fromJson(json) {
    return WeatherModel(cityName: json["location"]["name"],
    temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
     maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"], 
     mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
       date: json["current"]["last_updated"],
        wetherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"]
        );

  }
}
