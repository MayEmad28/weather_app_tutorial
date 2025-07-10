import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Search a City"),
      ),
      body: Center(
        child: TextField(
          // onChanged: (input) {

          // },
          onSubmitted: (input)  {
            
  BlocProvider.of<GetWeatherCubit>(context).getWeather(cityName: input);
  Navigator.pop(context);
},

          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 25),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
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
