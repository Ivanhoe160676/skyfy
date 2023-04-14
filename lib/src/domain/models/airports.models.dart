// ignore_for_file: avoid_print

class LocationCoordinate2D {
  LocationCoordinate2D({required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;

  @override
  String toString() {
    return "($latitude, $longitude)";
  }
}

class Airport {
  Airport({
    required this.name,
    required this.city,
    required this.country,
    required this.citycode,
    this.icao,
    required this.location,
  });
  //int airportID
  final String name;
  final String city;
  final String citycode;
  final String country;
  final String? icao;
  final LocationCoordinate2D location;

  static Airport? fromMap(String map) {
    final components = map.split(",");
    if (components.length < 8) {
      return null;
    }
    String name = unescapeString(components[1]);
    String city = unescapeString(components[2]);
    String country = unescapeString(components[3]);
    String citycode = unescapeString(components[4]);
    String icao = unescapeString(components[5]);
    try {
      double latitude = double.parse(unescapeString(components[6]));
      double longitude = double.parse(unescapeString(components[7]));
      final location =
          LocationCoordinate2D(latitude: latitude, longitude: longitude);
      return Airport(
        name: name,
        city: city,
        country: country,
        citycode: citycode,
        icao: icao,
        location: location,
      );
    } catch (e) {
      try {
        // sometimes, components[6] is a String and the lat-long are stored
        // at index 7 and 8
        double latitude = double.parse(unescapeString(components[7]));
        double longitude = double.parse(unescapeString(components[8]));
        final location =
            LocationCoordinate2D(latitude: latitude, longitude: longitude);
        return Airport(
          name: name,
          city: city,
          country: country,
          citycode: citycode,
          location: location,
        );
      } catch (e) {
        print(e);
        return null;
      }
    }
  }

  // All fields are escaped with double quotes. This method deals with them
  static String unescapeString(dynamic value) {
    if (value is String) {
      return value.replaceAll('"', '');
    }
    return '';
  }

  @override
  String toString() {
    return "($icao) -> $name, $city, $country, ${location.toString()}";
  }
}
