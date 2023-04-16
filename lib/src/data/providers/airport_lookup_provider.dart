import 'package:flutter/material.dart';
import 'package:skyfy/src/tools/airport_data_reader.dart';
import 'package:skyfy/src/tools/search/airport_lookup.dart';

class AirportLookupProvider with ChangeNotifier {
  final start = DateTime.now();
  Future<List> airports = AirportDataReader.load('assets/data/airports.dat');

  final AirportLookup airportLookup;

  AirportLookupProvider({required this.airportLookup});

  AirportLookup getAirportLookup() => airportLookup;
}
