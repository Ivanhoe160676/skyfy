import 'dart:async';

import 'package:skyfy/src/domain/models/airports.models.dart';
import 'package:flutter/services.dart' show rootBundle;

class AirportDataReader {
  static Future<List> load(String path) async {
    final data = await rootBundle.loadString(path);
    return data
        .split('\n')
        .map((line) => Airport.fromMap(line))
        .where((airport) => airport != null)
        .toList();
  }
}
