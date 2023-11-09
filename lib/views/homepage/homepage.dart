import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/controller/connectivity_controler.dart';
import 'package:weather/controller/homepagecontroller.dart';
import 'package:weather/views/widget/items.dart';
import 'package:weather/views/widget/subcontainer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<CheckconnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
    final homepageconter = Provider.of<Homepagecontroller>(
      context,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 62, 86, 98),
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        // backgroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 74, 137, 166),
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/weather12.png'), fit: BoxFit.cover)),
        child: FutureBuilder(
          future: homepageconter.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: 8, left: 8, right: 8, top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 470,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          currentWeather(
                              // Icons.wb_sunny_rounded,
                              "${homepageconter.data?.temp ?? 'N/A'}",
                              "${homepageconter.data?.cityName  ?? 'N/A'}"
                              ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "Additional Information",
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromARGB(255, 36, 81, 117),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.black,
                      child: additionalInformation(
                          "${homepageconter.data?.wind ?? 'N/A'}",
                          "${homepageconter.data?.humidity ?? 'N/A'}",
                          "${homepageconter.data?.pressure ?? 'N/A'}",
                          "${homepageconter.data?.feels_like ?? 'N/A'}"),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container();
          },
        ),
      ),
    );
  }
}

// https://api.openweathermap.org/data/2.5/weather?q=london&appid=e17d0b6f411cdb733836795ba61fe8ab