import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model/wether_model.dart';

class WeatherApiclient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=3837f082b65893f0fc5883912ebd9ac8&units=metric");
    var responce = await http.get(endpoint);
    print(responce);
    if (responce.statusCode == 200) {
      var body = jsonDecode(responce.body);
      print(responce.body);
      print('body$body');
      print('body${body.runtimeType}');
      print(Weather.formJson(body));
      print(Weather.formJson(body).runtimeType);
      return Weather.formJson(body);
    } else {
      // Return null in case of an error
      return Future.value(null);
    }
  }
}
