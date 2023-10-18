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
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        // backgroundColor: Color.fromARGB(255, 60, 170, 201),
        centerTitle: true,
        title: TextFormField(
  controller: Homepageconter.searchcontroller,
  decoration: InputDecoration(
    hintText: 'Search...',
   prefixIcon: IconButton(
            onPressed: Homepageconter.searcheds,
            color: Colors.blue,
            // getData();

            icon: const Icon(Icons.search)),
    // prefixIcon: Icon(Icons.search),
    filled: true,
    fillColor: Colors.white, // Background color
    contentPadding: EdgeInsets.all(12), // Adjust the padding
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue), // Change the focused border color
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey), // Change the enabled border color
      borderRadius: BorderRadius.circular(10),
    ),
    suffixIcon:     IconButton(
              onPressed: Homepageconter.clearsearch, icon: Icon(Icons.clear,color: Colors.black,))
  ),
),
      ),
      body: FutureBuilder(
        future: Homepageconter.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // if (data != null) {
            // Check if data is not null
            return Column(
              children: [
                Container(
                  
                    width: double.infinity,
                height: 470,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      // topLeft: Radius.circular(20),
      // topRight: Radius.circular(40),
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
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
                              "${Homepageconter.data!.temp}",
                              "${Homepageconter.data!.cityName}"),
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
                          // const Divider(),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                        
                        ],
                      ),
                    ],
                  ),
                ),
                  Card(
                    // elevation: 4,
                    
                        color: Colors.black,
                        child: additionalInformation(
                            "${Homepageconter.data!.wind}",
                            "${Homepageconter.data!.humidity}",
                            "${Homepageconter.data!.pressure}",
                            "${Homepageconter.data!.feels_like}"),
                      )
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