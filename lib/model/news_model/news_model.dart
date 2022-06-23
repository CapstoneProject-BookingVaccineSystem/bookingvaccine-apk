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
    required this.isDeleted,
    required this.idNewsVaccine,
    required this.titleNewsVaccine,
    required this.authorNewsVaccine,
    required this.imageNewsVaccine,
    required this.contentNewsVaccine,
  });

  DateTime createdAt;
  String createdBy;
  bool isDeleted;
  int idNewsVaccine;
  String titleNewsVaccine;
  String authorNewsVaccine;
  String imageNewsVaccine;
  String contentNewsVaccine;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        isDeleted: json["is_deleted"],
        idNewsVaccine: json["id_news_vaccine"],
        titleNewsVaccine: json["title_news_vaccine"],
        authorNewsVaccine: json["author_news_vaccine"],
        imageNewsVaccine: json["image_news_vaccine"],
        contentNewsVaccine: json["content_news_vaccine"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "is_deleted": isDeleted,
        "id_news_vaccine": idNewsVaccine,
        "title_news_vaccine": titleNewsVaccine,
        "author_news_vaccine": authorNewsVaccine,
        "image_news_vaccine": imageNewsVaccine,
        "content_news_vaccine": contentNewsVaccine,
      };
}
