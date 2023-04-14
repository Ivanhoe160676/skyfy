import 'dart:convert';

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    this.imagePath,
    this.role,
    this.member,
  });

  String id;
  String username;
  String email;
  String password;
  String? imagePath;
  String? role;
  String? member;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        imagePath: json["imagePath"],
        role: json["role"],
        member: json["member"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "imagePath": imagePath,
        "role": role,
        "member": member,
      };
}
