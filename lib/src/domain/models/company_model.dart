import 'dart:convert';

class Company {
  Company({
    required this.id,
    required this.name,
    required this.address,
    this.logo,
  });

  String id;
  String name;
  String address;
  String? logo;

  factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "logo": logo,
      };
}
