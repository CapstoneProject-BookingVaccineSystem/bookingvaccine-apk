// To parse this JSON data, do
//
//     final addFamillyModel = addFamillyModelFromJson(jsonString);

import 'dart:convert';

AddFamillyModel addFamillyModelFromJson(String str) =>
    AddFamillyModel.fromJson(json.decode(str));

String addFamillyModelToJson(AddFamillyModel data) =>
    json.encode(data.toJson());

class AddFamillyModel {
  AddFamillyModel({
    required this.fullName,
    required this.idUser,
    required this.nik,
  });

  String fullName;
  int idUser;
  String nik;

  factory AddFamillyModel.fromJson(Map<String, dynamic> json) =>
      AddFamillyModel(
        fullName: json["full_name"],
        idUser: json["id_user"],
        nik: json["nik"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "id_user": idUser,
        "nik": nik,
      };
}
