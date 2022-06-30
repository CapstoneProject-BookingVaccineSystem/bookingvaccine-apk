// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.isDeleted,
    required this.idNewsVaccine,
    required this.titleNewsVaccine,
    required this.authorNewsVaccine,
    required this.contentNewsVaccine,
    this.image,
    this.fileName,
    required this.size,
  });

  DateTime createdAt;
  String createdBy;
  dynamic updatedAt;
  bool isDeleted;
  int idNewsVaccine;
  String titleNewsVaccine;
  String authorNewsVaccine;
  String contentNewsVaccine;
  String? image;
  String? fileName;
  int size;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        isDeleted: json["is_deleted"],
        idNewsVaccine: json["id_news_vaccine"],
        titleNewsVaccine: json["title_news_vaccine"],
        authorNewsVaccine: json["author_news_vaccine"],
        contentNewsVaccine: json["content_news_vaccine"],
        image: json["image"],
        fileName: json["file_name"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt,
        "is_deleted": isDeleted,
        "id_news_vaccine": idNewsVaccine,
        "title_news_vaccine": titleNewsVaccine,
        "author_news_vaccine": authorNewsVaccine,
        "content_news_vaccine": contentNewsVaccine,
        "image": image,
        "file_name": fileName,
        "size": size,
      };
}
