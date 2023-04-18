import 'dart:convert';

class Aircraft {
  Aircraft({
    required this.id,
    required this.brand,
    required this.model,
    required this.register,
    required this.year,
    this.picture,
    required this.company,
    required this.status,
    required this.passengerCapacity,
    required this.hours,
  });

  String id;
  String brand;
  String model;
  String register;
  String year;
  String? picture;
  String company;
  String status;
  String passengerCapacity;
  String hours;

  factory Aircraft.fromRawJson(String str) =>
      Aircraft.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Aircraft.fromJson(Map<String, dynamic> json) => Aircraft(
        id: json["id"],
        brand: json["brand"],
        model: json["model"],
        register: json["register"],
        year: json["year"],
        picture: json["picture"],
        company: json["company"],
        status: json["status"],
        passengerCapacity: json["Passenger capacity"],
        hours: json["hours"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "model": model,
        "register": register,
        "year": year,
        "picture": picture,
        "company": company,
        "status": status,
        "Passenger capacity": passengerCapacity,
        "hours": hours,
      };
}
