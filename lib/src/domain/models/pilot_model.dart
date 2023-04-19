import 'dart:convert';

class Pilot {
  Pilot({
    required this.id,
    required this.username,
    required this.email,
    required this.status,
    required this.company,
    required this.imagePath,
    required this.role,
    required this.hours,
  });

  final String id;
  final String username;
  final String email;
  final String status;
  final String company;
  final String imagePath;
  final String role;
  final String hours;

  Pilot copyWith({
    required String id,
    required String username,
    required String email,
    required String status,
    required String company,
    required String imagePath,
    required String role,
    required String hours,
  }) =>
      Pilot(
        id: id,
        username: username,
        email: email,
        status: status,
        company: company,
        imagePath: imagePath,
        role: role,
        hours: hours,
      );

  factory Pilot.fromJson(String str) => Pilot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pilot.fromMap(Map<String, dynamic> json) => Pilot(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        status: json["status"],
        company: json["company"],
        imagePath: json["imagePath"],
        role: json["role"],
        hours: json["hours"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "status": status,
        "company": company,
        "imagePath": imagePath,
        "role": role,
        "hours": hours,
      };
}
