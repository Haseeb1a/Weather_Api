import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../model/wether_model.dart';
import '../services/weather_api.dart';

class Homepagecontroller extends ChangeNotifier {
  //WeatherApiclient client = WeatherApiclient();
  Weather? data;
  String searched = "london";
  final TextEditingController searchcontroller = TextEditingController();
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  // getconnectivity(BuildContext context) {

  //  subscription = Connectivity().onConnectivityChanged.listen(
  //     (ConnectivityResult result) async {
  //    isDeviceConnected =
  //           await InternetConnectionChecker().hasConnection;
  //       if (!isDeviceConnected &&
  //      isAlertSet == false) {
  //        ShowDialogBox();

  //        isAlertSet = true;

  //         notifyListeners();
  //         ;
  //       }
  //     },
  //   );
  // }

  Future<void> getData() async {
    print(searched);

    data = await WeatherApiclient().getCurrentWeather(searched);

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
