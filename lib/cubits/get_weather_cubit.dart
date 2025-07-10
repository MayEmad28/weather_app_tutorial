import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
   WeatherModel? weatherModel;
  GetWeatherCubit() : super(NoWeatherState());

  Future<void> getWeather({required String cityName}) async {
    try {
       weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
       print('Weather Data: ${weatherModel!.cityName}');
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
