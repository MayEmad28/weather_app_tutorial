import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Search a City"),
      ),
      body: Center(
        child: TextField(
          // onChanged: (input) {

          // },
          onSubmitted: (input) async{
            WeatherModel? weatherModel= await WeatherService(Dio()).getCurrentWeather(cityName: input);
           print(weatherModel?.cityName);
          },
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 25),
              border:
                  OutlineInputBorder( 
                  borderRadius:  BorderRadius.circular(5),

                  ),
                    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
              hintText: 'Enter City Name',
              hintStyle: TextStyle(color: Colors.black),
              label: Text('Search')),
        ),
      ),
    );
  }
}
