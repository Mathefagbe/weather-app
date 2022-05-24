import 'dart:convert';
import 'package:weather_app/Data/models/weathermodel.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/constant/strings.dart';

class DataService {
  Future<Weather> weatherinfo() async {
    late Weather weathers;

    try {
      final response = await http.get(Uri.parse(
          "http://api.weatherapi.com/v1/forecast.json?key=17775516ac1c40a396d115546223004&q=$cityname&days=1&aqi=no&alerts=no"));
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        var jsonmap = jsonDecode(jsonstring);
        weathers = Weather.fromJson(jsonmap);
      }
    } catch (e) {
      throw Exception("$e");
    }
    return weathers;
  }
}
