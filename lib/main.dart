import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/screens/cairo_weather.dart';
import 'package:weatherapp/test.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: Colors.deepPurple,
          appBarTheme: AppBarTheme(color: Colors.deepPurple)
      ),
      home: MainScreen(),
    );
  }
}