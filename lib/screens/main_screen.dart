import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/screens/cairo_weather.dart';
import 'package:weatherapp/screens/london.dart';
import 'package:weatherapp/screens/paris.dart';
import 'package:weatherapp/screens/weather_screen.dart';
import 'package:weatherapp/services/weather_services.dart';

import '../constants/componants.dart';
import '../models/weather_models.dart';

class MainScreen extends StatelessWidget {
  WeatherService weatherService = WeatherService();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    return Scaffold(

      backgroundColor: Colors.blue[500],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        elevation: 0,
        title: Text(
          "Weather",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formstate,
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Enter city name",
                          filled: true,
                          fillColor: Colors.blue[300],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onSubmitted: (data) async {
                        cityName = data;
                        WeatherModel weather = await weatherService.getWeather(
                            cityName: cityName!);
                        weatherData = weather;
                        Get.to(() => Weather_Screen());
                      },
                    ),
                    defultfuturebuilder("Cairo",Cairo_Weather(),Container(
                      height: 100,
                    )),
                    defultfuturebuilder("Paris",Paris_Weather(),Container(height: 150,)),
                    defultfuturebuilder("London",London_Weather(),CircularProgressIndicator(color: Colors.white,)),
                  ],
                ))),
      ),
    );
  }
}

WeatherModel? weatherData;
String? cityName;
