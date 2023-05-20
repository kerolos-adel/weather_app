class WeatherModel {
  final String cityname;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherStateName;
  final double wed;
  final double thu;


  WeatherModel({

    required this.cityname,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weatherStateName,
    required this.wed,
    required this.thu,
  });

  getImage() {
    if (weatherStateName == "Sunny") {
      return "images/sun.jpg";
    } else if (weatherStateName == "Patchy rain possible") {
      return "images/10.jpg";
    } else if (weatherStateName == "Overcast") {
      return "images/14.png";
    } else if (weatherStateName == "Cloudy") {
      return "images/14.png";
    } else {
      return "images/clear.jpg";
    }
  }
}
