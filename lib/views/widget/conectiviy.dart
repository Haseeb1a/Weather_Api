import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:weather/controller/connectivity_controler.dart';

class Checkconnectivity {
  showDialogBox(context) {
    final connection =
        Provider.of<CheckconnectivityProvider>(context, listen: false);
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("No Connection"),
        content: const Text("Please check your internet connectivity"),
        actions: <Widget>[
          TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');

                connection.isAlertSet = false;

                connection.isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!connection.isDeviceConnected) {
                  showDialogBox(context);

                  connection.isAlertSet = true;
                }
              },
              child: const Text('OK'))
        ],
      ),
    );
  }
}
