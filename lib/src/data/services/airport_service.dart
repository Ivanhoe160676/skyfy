// ignore_for_file: avoid_print

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AirportService {
  Future<dynamic> getAirportsByName() async {
    try {
      final resp = await rootBundle.loadString('assets/json/airports.json');
      final data = json.decode(resp);

      //print(data);
      //final Map airportList = data;
      return data.map((obj) => data.fromJson(obj)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
