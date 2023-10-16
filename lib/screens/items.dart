import 'package:flutter/material.dart';

Widget additionalInformation(
    String wind, String humidity, String pressure, String feellike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         
            const Column( 
                  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Text(
              "wind",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "pressure",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$wind",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "$pressure",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
                  const Column( 
                  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Text(
              "humidiyu",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "feels like",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$humidity",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "$feellike",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
      
              ],
            ),   
      ])
      ],
    ),
  );
}
