import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/weather_services.dart';

class Paris_Weather extends StatelessWidget {
  WeatherService weatherService = WeatherService();
  TextStyle style = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
  TextStyle hourstyle = TextStyle(
    fontSize: 12,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue[500],
        elevation: 0,
      ),
      backgroundColor: Colors.blue[500],
      body: Form(
          child: Column(
            children: [
              FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return const Text('No data found');
                    } else {
                      final weather = snapshot.data!;
                      return Center(
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 210,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[300],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${weather.cityname}",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text("${weather.weatherStateName}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text("${weather.temp} ْ C",
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text("min: ${weather.mintemp} ْ C",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text("max: ${weather.maxtemp} ْ C",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Tomorrow",
                                            style: style,
                                          ),
                                          Text(
                                            "${weather.wed}ْ C",
                                            style: style,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 180,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[300],
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "After Tomorrow",
                                            style: style,
                                          ),
                                          Text(
                                            "${weather.thu}ْ C",
                                            style: style,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 50),
                                Image.asset(
                                  weather.getImage(),
                                ),


                              ],
                            )),
                      );
                    }
                  },
                  future: WeatherService().getWeather(cityName: "paris")),
            ],
          )),
    );  }
}
