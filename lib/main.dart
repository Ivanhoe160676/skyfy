import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skyfy/inject_dependencies.dart';
import 'package:skyfy/src/locale/languages.dart';
import 'package:skyfy/src/tools/airport_data_reader.dart';
import 'package:skyfy/src/tools/search/airport_lookup.dart';
import 'firebase_options.dart';
import 'package:skyfy/src/skyfy.dart';
import 'src/store/app_store.dart';

AppStore appStore = AppStore();
BaseLanguage? language;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await injectDependencies();
  final start = DateTime.now();
  List airports = await AirportDataReader.load('assets/data/airports.dat');
  final elapsed = DateTime.now().difference(start);
  print('Loaded airports data in $elapsed');
  runApp(SkyFy(airportLookup: AirportLookup(airports: airports)));
}
