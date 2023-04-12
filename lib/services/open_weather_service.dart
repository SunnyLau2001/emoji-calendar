import 'dart:convert';
import 'dart:math';

import 'package:fyp_our_sky_new/models/event.dart';
import 'package:http/http.dart' as http;

import 'package:fyp_our_sky_new/models/weather_detail.dart';
import 'package:isar/isar.dart';

import 'isar_service.dart';

class OpenWeatherService {
  late Future<Isar> isar;

  OpenWeatherService() {
    isar = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      await IsarService.initIsar();
    }
    return Future.value(Isar.getInstance());
  }

  Future<List<WeatherDetail>> getWeatherDetail(double lat, double lng) async {
    var url = Uri.https("api.openweathermap.org", "/data/2.5/forecast",
        {"lat": "$lat", "lon": "$lng", "units": "metric", "cnt": "5", "appid": "81adc6be11facace01f2b7aa78a529fb"});
    await Future.delayed(const Duration(seconds: 1));

    var response = await http.get(url);
    // print('Response body: ${response.body}');
    final json = jsonDecode(response.body);
    List<dynamic> weatherList = json['list'];
    return weatherList.map<WeatherDetail>((weather) => WeatherDetail.fromJson(weather)).toList();
  }

  Future<void> updateWeatherByEventId(int eventId) async {
    print(eventId);
    final db = await isar;
    Event? event = await db.events.get(eventId);
    if (event == null) return;
    if (event.latlng == null) return;
    final now = DateTime.now();
    // event.weatherLastUpdate ??= now;
    // if (event.weatherLastUpdate != null && event.weatherLastUpdate!.difference(now).inHours.abs() < 3) {
    //   return;
    // }
    final response = await getWeatherDetail(event.latlng![0], event.latlng![1]);
    // for (int i = 0; i < response.length; i++) {
    //   print("Weather Time ---------------------");
    //   print(response[i].dateTime);
    //   print(now);
    //   print("now after weather dt?---------------------");
    //   print(now.isAfter(response[i].dateTime));
    // }
    print(response);
    if (response.isNotEmpty) {
      print("Not Empty");
      event.weather = response[0].weather;
      event.temperature = response[0].temp;
      event.weatherLastUpdate = now;
    }
    db.writeTxn(() async {
      db.events.put(event);
    });
  }
}
