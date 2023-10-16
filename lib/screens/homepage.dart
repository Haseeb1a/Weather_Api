import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/controller/homepagecontroller.dart';
import 'package:weather/screens/items.dart';
import 'package:weather/model/wether_model.dart';
import 'package:weather/services/weather_api.dart';
import 'package:weather/screens/subcontainer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // WeatherApiclient client = WeatherApiclient();
  // final TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Homepageconter = Provider.of<Homepagecontroller>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: TextFormField(
          controller: Homepageconter.searchcontroller,
        ),
        leading: IconButton(
            onPressed: Homepageconter.searcheds,
            // getData();

            icon: const Icon(Icons.search)),
        actions: [
          IconButton(
              onPressed: Homepageconter.clearsearch, icon: Icon(Icons.clear))
        ],
      ),
      body: FutureBuilder(
        future: Homepageconter.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // if (data != null) {
            // Check if data is not null
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(
                    Icons.wb_sunny_rounded,
                    "${Homepageconter.data!.temp}",
                    "${Homepageconter.data!.cityName}"),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                additionalInformation(
                    "${Homepageconter.data!.wind}",
                    "${Homepageconter.data!.humidity}",
                    "${Homepageconter.data!.pressure}",
                    "${Homepageconter.data!.feels_like}")
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}

// https://api.openweathermap.org/data/2.5/weather?q=london&appid=e17d0b6f411cdb733836795ba61fe8ab