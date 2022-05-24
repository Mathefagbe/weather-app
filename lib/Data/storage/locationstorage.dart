import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/Data/models/weathermodel.dart';
import 'package:weather_app/lists/loationlist.dart';

// class Completedtask {
//   static Future<void> savecomplete() async {
//     final _pref = await SharedPreferences.getInstance();
//     List<String> saved =
//         locations.map((item) => jsonEncode(item.toJson())).toList();
//     await _pref.setStringList("saved", saved);
//   }

//   static Future<List<Weather>> loadcomplete() async {
//     final _pref = await SharedPreferences.getInstance();
//     List<String> load = _pref.getStringList("saved") ?? [];

//     List<Weather> loaded =
//         load.map((item) => Weather.fromJson(jsonDecode(item))).toList();

//     return loaded;
//   }
// }
