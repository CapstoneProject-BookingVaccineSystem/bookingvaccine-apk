// To parse this JSON data, do
//
//     final famillyModel = famillyModelFromJson(jsonString);

import 'dart:convert';

FamillyModel famillyModelFromJson(String str) =>
    FamillyModel.fromJson(json.decode(str));

String famillyModelToJson(FamillyModel data) => json.encode(data.toJson());

class FamillyModel {
  FamillyModel({
    required this.createdAt,
    required this.createdBy,
    required this.isDeleted,
    required this.idFamily,
    required this.nik,
    required this.fullName,
    required this.userMapped,
  });

  DateTime createdAt;
  String createdBy;
  bool isDeleted;
  int idFamily;
  String nik;
  String fullName;
  UserMapped userMapped;

  factory FamillyModel.fromJson(Map<String, dynamic> json) => FamillyModel(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        isDeleted: json["is_deleted"],
        idFamily: json["id_family"],
        nik: json["nik"],
        fullName: json["full_name"],
        userMapped: UserMapped.fromJson(json["user_mapped"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "is_deleted": isDeleted,
        "id_family": idFamily,
        "nik": nik,
        "full_name": fullName,
        "user_mapped": userMapped.toJson(),
      };
}

class UserMapped {
  UserMapped({
    required this.createdAt,
    required this.createdBy,
    required this.isDeleted,
    required this.idUser,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.gender,
    required this.email,
    required this.noPhone,
    required this.roles,
  });

  DateTime createdAt;
  String createdBy;
  bool isDeleted;
  int idUser;
  String username;
  String password;
  String firstName;
  String lastName;
  DateTime birthDate;
  String gender;
  String email;
  String noPhone;
  String roles;

  factory UserMapped.fromJson(Map<String, dynamic> json) => UserMapped(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        isDeleted: json["is_deleted"],
        idUser: json["id_user"],
        username: json["username"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthDate: DateTime.parse(json["birth_date"]),
        gender: json["gender"],
        email: json["email"],
        noPhone: json["no_phone"],
        roles: json["roles"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "is_deleted": isDeleted,
        "id_user": idUser,
        "username": username,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "birth_date":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "email": email,
        "no_phone": noPhone,
        "roles": roles,
      };
}
