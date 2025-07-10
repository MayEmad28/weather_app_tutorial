import 'package:weather_app/Models/weather_model.dart';

class WeatherStates {}

class NoWeatherState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates {}

