import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_screen.dart';

class Weather_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontSize: 20, color: Colors.white,);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/3.jpg",
            fit: BoxFit.fill,
            height: double.infinity,
          ),
          Container(
            child: IconButton(
                onPressed: () {
                  Get.to(() => MainScreen());
                },
                icon: Icon(Icons.arrow_back),
                alignment: Alignment(3, 5)),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 120, 0, 0),
            height: 250,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("images/sun.jpg")),
                Text(
                  "${weatherData!.cityname}",
                  style: style,
                ),
                Text(
                  "${weatherData!.temp}",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Today",
                  style: style,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(170, 550, 10, 0),
            height: 100,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.6),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Today,s Weather",
                      style: style,
                    ),
                    Text(
                      "min: ${weatherData!.mintemp} ْ C",
                      style: style,
                    ),
                    Text(
                      "max: ${weatherData!.maxtemp} ْ C",
                      style: style,
                    ),
                  ],
                ),
                Image(image: AssetImage("images/sun.jpg")),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 700, 0, 0),
            child:Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tomorrow",style: style,
                      ),
                      Text(
                        "${weatherData!.wed}ْ C",style: style,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "After Tomorrow",style: style,
                      ),
                      Text(
                        "${weatherData!.thu}ْ C",style: style,
                      ),
                    ],
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
