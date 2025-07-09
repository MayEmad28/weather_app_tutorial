import 'package:dio/dio.dart';
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  final Dio dio;
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'a99b35bc3a2c408885d134450250907';

  WeatherService(this.dio);
  Future<WeatherModel?> getCurrentWeather({required cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['error']['message'] ?? "Error,Try Later";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("Error,Try Later");
    }
  }
}

WeatherModel? weatherModel;
