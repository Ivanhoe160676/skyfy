import 'dart:convert';

class Pilot {
  Pilot({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.imagePath,
    required this.role,
    required this.license,
    required this.rate,
    required this.hours,
  });

  String id;
  String username;
  String email;
  String password;
  String imagePath;
  String role;
  String license;
  String rate;
  String hours;

  factory Pilot.fromRawJson(String str) => Pilot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pilot.fromJson(Map<String, dynamic> json) => Pilot(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        imagePath: json["imagePath"],
        role: json["role"],
        license: json["license"],
        rate: json["rate"],
        hours: json["hours"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "imagePath": imagePath,
        "role": role,
        "license": license,
        "rate": rate,
        "hours": hours,
      };
}
