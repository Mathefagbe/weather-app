// To parse this JSON data, do
//
//     final weathers = weathersFromJson(jsonString);

import 'dart:convert';

Weather weathersFromJson(String str) => Weather.fromJson(json.decode(str));

String weathersToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  Location location;
  Current current;
  Forecast forecast;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
        "forecast": forecast.toJson(),
      };
}

class Current {
  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.uv,
  });

  String lastUpdated;
  double tempC;
  double tempF;
  int isDay;
  CurrentCondition condition;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  double uv;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"].toDouble(),
        tempF: json["temp_f"],
        isDay: json["is_day"],
        condition: CurrentCondition.fromJson(json["condition"]),
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"].toDouble(),
        feelslikeF: json["feelslike_f"].toDouble(),
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "uv": uv,
      };
}

class CurrentCondition {
  CurrentCondition({
    required this.text,
    required this.icon,
  });

  String text;
  String? icon;

  factory CurrentCondition.fromJson(Map<String, dynamic> json) =>
      CurrentCondition(
        text: json["text"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
      };
}

class Forecast {
  Forecast({
    required this.forecastday,
  });

  List<Forecastday> forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<Forecastday>.from(
            json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
      };
}

class Forecastday {
  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  DateTime date;
  int dateEpoch;
  Day day;
  Astro astro;
  List<Hour> hour;

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: Day.fromJson(json["day"]),
        astro: Astro.fromJson(json["astro"]),
        hour: List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day.toJson(),
        "astro": astro.toJson(),
        "hour": List<dynamic>.from(hour.map((x) => x.toJson())),
      };
}

class Astro {
  Astro();

  factory Astro.fromJson(Map<String, dynamic> json) => Astro();

  Map<String, dynamic> toJson() => {};
}

class Day {
  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.dailyChanceOfRain,
    required this.dailyChanceOfSnow,
    required this.condition,
  });

  double maxtempC;
  double maxtempF;
  double mintempC;
  double mintempF;
  int dailyChanceOfRain;
  int dailyChanceOfSnow;
  DayCondition condition;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"].toDouble(),
        maxtempF: json["maxtemp_f"].toDouble(),
        mintempC: json["mintemp_c"].toDouble(),
        mintempF: json["mintemp_f"].toDouble(),
        dailyChanceOfRain: json["daily_chance_of_rain"],
        dailyChanceOfSnow: json["daily_chance_of_snow"],
        condition: DayCondition.fromJson(json["condition"]),
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mintemp_c": mintempC,
        "mintemp_f": mintempF,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition.toJson(),
      };
}

class DayCondition {
  DayCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  String text;
  String icon;
  int code;

  factory DayCondition.fromJson(Map<String, dynamic> json) => DayCondition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class Hour {
  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.chanceOfRain,
    required this.chanceOfSnow,
  });

  int timeEpoch;
  String time;
  double tempC;
  double tempF;
  int isDay;
  DayCondition condition;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  int chanceOfRain;
  int chanceOfSnow;

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json["time_epoch"],
        time: json["time"],
        tempC: json["temp_c"].toDouble(),
        tempF: json["temp_f"].toDouble(),
        isDay: json["is_day"],
        condition: DayCondition.fromJson(json["condition"]),
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"].toDouble(),
        feelslikeF: json["feelslike_f"].toDouble(),
        chanceOfRain: json["chance_of_rain"],
        chanceOfSnow: json["chance_of_snow"],
      );

  Map<String, dynamic> toJson() => {
        "time_epoch": timeEpoch,
        "time": time,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition.toJson(),
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "chance_of_rain": chanceOfRain,
        "chance_of_snow": chanceOfSnow,
      };
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}
