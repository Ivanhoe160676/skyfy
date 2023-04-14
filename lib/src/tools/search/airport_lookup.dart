import 'package:skyfy/src/domain/models/airports.models.dart';

class AirportLookup {
  AirportLookup({required this.airports});
  final List airports;

  Airport searchicao(String icao) {
    return airports.firstWhere((airport) => airport.icao == icao);
  }

  List searchString(String string) {
    string = string.toLowerCase();
    final matching = airports.where((airport) {
      final icao = airport.icao ?? '';
      return icao.toLowerCase() == string ||
          airport.name.toLowerCase() == string ||
          airport.city.toLowerCase() == string ||
          airport.country.toLowerCase() == string;
    }).toList();
    // found exact matches
    if (matching.isNotEmpty) {
      return matching;
    }
    // search again with less strict criteria
    return airports.where((airport) {
      final icao = airport.icao ?? '';
      return icao.toLowerCase().contains(string) ||
          airport.name.toLowerCase().contains(string) ||
          airport.city.toLowerCase().contains(string) ||
          airport.country.toLowerCase().contains(string);
    }).toList();
  }
}
