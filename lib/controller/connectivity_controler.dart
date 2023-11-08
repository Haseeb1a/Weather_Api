import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather/views/widget/conectiviy.dart';

class CheckconnectivityProvider extends ChangeNotifier {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;
  Future getInternetConnectivity(BuildContext context) async {
    getConnectivity(context);
  }
  getConnectivity(BuildContext context) {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;

      if (!isDeviceConnected && isAlertSet == false) {
        Checkconnectivity().showDialogBox(context);

        isAlertSet = true;
      }
    });
  }
}
