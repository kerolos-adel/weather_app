import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/weather_models.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'fa5ff59b7b854b11896125136232504';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    var jsonData = data['forecast']['forecastday'][0]['day'];
    var hoursJsonData = data['forecast']['forecastday'][0]['hour'];
    var hoursJsonData2 = data['forecast']['forecastday'][0]['hour'];


    WeatherModel weatherModel = WeatherModel(
      cityname: data['location']['name'],
      temp: jsonData['avgtemp_c'],
      maxtemp: jsonData['maxtemp_c'],
      mintemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
      wed: data['forecast']['forecastday'][1]['day']['avgtemp_c'],
      thu: data['forecast']['forecastday'][2]['day']['avgtemp_c'],

    );
    return weatherModel;
  }
}
