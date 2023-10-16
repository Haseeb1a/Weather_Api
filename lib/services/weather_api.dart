import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model/wether_model.dart';

class WeatherApiclient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
     "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=3837f082b65893f0fc5883912ebd9ac8&units=metric");
    var responce = await http.get(endpoint);
    var body = jsonDecode(responce.body);
    return Weather.formJson(body);
  }
}
