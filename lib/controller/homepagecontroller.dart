import 'package:flutter/material.dart';

import '../model/wether_model.dart';
import '../services/weather_api.dart';

class Homepagecontroller extends ChangeNotifier {
  WeatherApiclient client = WeatherApiclient();
  Weather? data;
  String searched = "london";
  final TextEditingController searchcontroller = TextEditingController();
  Future<void> getData() async {
    data = await client.getCurrentWeather(searched);

    //  notifyListeners();
  }

  searcheds() {
    searched = searchcontroller.text;
    // print(searched);
    getData();

    searched;
    notifyListeners();
  }

  clearsearch() {
    searchcontroller.clear();
  }
}
