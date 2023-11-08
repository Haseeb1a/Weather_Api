import 'package:flutter/material.dart';

Widget additionalInformation(
    String wind, String humidity, String pressure, String feellike) {
  final style =  const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.yellow,
  );
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(
                          colors: [Color.fromARGB(255, 16, 59, 94), Color.fromARGB(255, 164, 192, 215)],
                        ),
    ),
    width: double.infinity,
    padding: const EdgeInsets.all(20),
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
                    Row(
                      children: [
                        Icon(
                          Icons.air,
                          color: Colors.white,
                        ),
                        Text(
                          " Wind",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.cloud_download_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          "  Pressure ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$wind",
                    style: style
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "$pressure",
                    style:style
                  ),
                ],
              ),
              const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.cloudy_snowing,
                          color: Colors.white,
                        ),
                        Text(
                          " Humidity ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          " Feels like ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$humidity",
                    style: style
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "$feellike",
                    style: style
                  ),
                ],
              ),
            ])
      ],
    ),
  );
}
