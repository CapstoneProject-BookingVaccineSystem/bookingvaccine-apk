// To parse this JSON data, do
//
//     final areaModel = areaModelFromJson(jsonString);

import 'dart:convert';

AreaModel areaModelFromJson(String str) => AreaModel.fromJson(json.decode(str));

String areaModelToJson(AreaModel data) => json.encode(data.toJson());

class AreaModel {
  AreaModel({
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.isDeleted,
    required this.idArea,
    required this.areaName,
  });

  DateTime createdAt;
  String createdBy;
  dynamic updatedAt;
  bool isDeleted;
  int idArea;
  String areaName;

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        isDeleted: json["is_deleted"],
        idArea: json["id_area"],
        areaName: json["area_name"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt,
        "is_deleted": isDeleted,
        "id_area": idArea,
        "area_name": areaName,
      };
}
