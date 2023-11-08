import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/controller/homepagecontroller.dart';
import 'package:weather/views/widget/items.dart';
import 'package:weather/views/widget/subcontainer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  // WeatherApiclient client = WeatherApiclient();
  @override
  void initState() {
    getconnectivity();
    // TODO: implement initState
    super.initState();
  }

  getconnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            ShowDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //WeatherApiclient client = WeatherApiclient();
    final homepageconter = Provider.of<Homepagecontroller>(
      context,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        
        elevation: 0,
        // backgroundColor: Colors.black,
        backgroundColor:Colors.black,
        centerTitle: true,
        title: TextFormField(
          controller: homepageconter.searchcontroller,
          decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: IconButton(
                  onPressed: homepageconter.searcheds,
                  color: Colors.blue,
                  // getData();

                  icon: const Icon(Icons.search)),
              // prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white, // Background color
              contentPadding: const EdgeInsets.all(12), // Adjust the padding
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.blue), // Change the focused border color
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.grey), // Change the enabled border color
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                  onPressed: homepageconter.clearsearch,
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ))),
        ),
      ),
      body: FutureBuilder(
        future: homepageconter.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8,left: 8,right:8,top: 8 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.infinity,
                    height: 470,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25)
                    
                      ),
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(255, 255, 255, 255), Colors.blue],
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            currentWeather(
                                // Icons.wb_sunny_rounded,
                                "${homepageconter.data!.temp}",
                                "${homepageconter.data!.cityName}"),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text(
                              "Additional Information",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 252, 255, 73),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    // elevation: 4,
            
                    color: Colors.black,
                    child: additionalInformation(
                        "${homepageconter.data!.wind}",
                        "${homepageconter.data!.humidity}",
                        "${homepageconter.data!.pressure}",
                        "${homepageconter.data!.feels_like}"),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }

  ShowDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text('No connection'),
            content: Text("Please check  your internet connectivity"),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => isAlertSet = false);
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    ShowDialogBox();
                    setState(() => isAlertSet = true);
                  }
                },
                child: Text('ok'),
              )
            ],
          ));
}

// https://api.openweathermap.org/data/2.5/weather?q=london&appid=e17d0b6f411cdb733836795ba61fe8ab