import 'package:flutter/material.dart';

Widget currentWeather( String temp, String location) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
Container(
  width: 200, // Set the desired width for your container
  height: 200, // Set the desired height for your container
  child: ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(50),
      topRight: Radius.circular(50),
      bottomLeft: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
    child: Image.asset(
      'assets/weather.png', // Replace with the path to your image asset
      fit: BoxFit.fill, // Use BoxFit.fill to fill the container
    ),
  ),
),
      SizedBox(height: 10.0,),
      Text("$temp °C",style: TextStyle(fontSize: 46,color: Colors.white),),
       SizedBox(height: 10.0,),
      Text("$location",style: TextStyle(fontSize: 46,),),     
      ],
    ),
  );
}
