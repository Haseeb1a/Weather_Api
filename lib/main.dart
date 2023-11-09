import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/controller/connectivity_controler.dart';
import 'package:weather/controller/homepagecontroller.dart';
import 'package:weather/views/homepage/homepage.dart';
import 'package:weather/views/widget/subcontainer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Homepagecontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckconnectivityProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MyHomePage()),
    );
  }
}
