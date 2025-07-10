import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';



void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const WeatherAppView(),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        final weatherModel = context.read<GetWeatherCubit>().weatherModel;
        final condition = weatherModel?.wetherCondition;

        return MaterialApp(
          theme: ThemeData(
            primarySwatch: getThemeColor(condition),
            appBarTheme: AppBarTheme(
              color: getThemeColor(condition),
            ),
          ),
          home: const HomeView(),
        );
      },
    );
  }
}
MaterialColor getThemeColor(String? condition) {
  if (condition == null || condition.isEmpty) {
    return Colors.teal; // اللون الافتراضي لو مفيش condition
  }

  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.blueGrey;
    case 'cloudy':
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.blue;
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'patchy light snow':
    case 'light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'patchy moderate snow':
    case 'patchy heavy snow':
    case 'ice pellets':
    case 'blizzard':
    case 'blowing snow':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.lightBlue;
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.cyan;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    default:
      return Colors.teal;
  }
}
