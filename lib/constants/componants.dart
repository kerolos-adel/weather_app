import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/screens/cairo_weather.dart';
import 'package:weatherapp/services/weather_services.dart';

Widget defultfuturebuilder(
    String cityname,
    Widget widget,
    Widget widget2,
) {
  return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: widget2);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('No data found');
        } else {
          final weather = snapshot.data!;
          return Center(
            child: InkWell(
                onTap: () {
                  Get.to(() => widget);
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${weather.cityname}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Image.asset(weather.getImage()),
                                  Text("${weather.weatherStateName}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("${weather.temp} ْ C",
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("${weather.maxtemp} ْ C",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  Text("${weather.mintemp} ْ C",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              )
                            ],
                          )),
                        ))),
          );
        }
      },
      future: WeatherService().getWeather(cityName: cityname));
}
