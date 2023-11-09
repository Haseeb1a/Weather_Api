import 'package:flutter/material.dart';

Widget currentWeather( String temp, String location) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10,),
Container(
  width: 180, // Set the desired width for your container
  height: 180, // Set the desired height for your container
  child: ClipRRect(
    borderRadius: const BorderRadius.all(
    Radius.circular(50)
    
    ),
    child: Image.asset(
      'assets/weather.png', // Replace with the path to your image asset
      fit: BoxFit.fill, // Use BoxFit.fill to fill the container
    ),
  ),
),
      const SizedBox(height: 10.0,),
      Text("$temp °C",style: const TextStyle(fontSize: 46,color: Colors.orange,fontWeight: FontWeight.bold),),
       const SizedBox(height: 10.0,),
      Text("$location",style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),     
      ],
    ),
  );
}
