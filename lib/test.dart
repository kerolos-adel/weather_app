import 'package:flutter/material.dart';
import 'package:weatherapp/screens/main_screen.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${weatherData!.temp}"),
      ),
    );
  }
}
