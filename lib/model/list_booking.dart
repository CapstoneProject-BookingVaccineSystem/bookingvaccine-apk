// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.isDeleted,
    required this.idBooking,
    required this.userMapped,
    required this.familyMapped,
    required this.sessionMapped,
  });

  DateTime createdAt;
  String createdBy;
  dynamic updatedAt;
  bool isDeleted;
  int idBooking;
  UserMapped userMapped;
  FamilyMapped familyMapped;
  SessionMapped sessionMapped;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        isDeleted: json["is_deleted"],
        idBooking: json["id_booking"],
        userMapped: UserMapped.fromJson(json["user_mapped"]),
        familyMapped: FamilyMapped.fromJson(json["family_mapped"]),
        sessionMapped: SessionMapped.fromJson(json["session_mapped"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt,
        "is_deleted": isDeleted,
        "id_booking": idBooking,
        "user_mapped": userMapped.toJson(),
        "family_mapped": familyMapped.toJson(),
        "session_mapped": sessionMapped.toJson(),
      };
}

class FamilyMapped {
  FamilyMapped({
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.isDeleted,
    required this.idFamily,
    required this.nik,
    required this.fullName,
    required this.userMapped,
  });

  DateTime createdAt;
  String createdBy;
  dynamic updatedAt;
  bool isDeleted;
  int idFamily;
  String nik;
  String fullName;
  UserMapped userMapped;

  factory FamilyMapped.fromJson(Map<String, dynamic> json) => FamilyMapped(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        isDeleted: json["is_deleted"],
        idFamily: json["id_family"],
        nik: json["nik"],
        fullName: json["full_name"],
        userMapped: UserMapped.fromJson(json["user_mapped"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt,
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
    required this.updatedAt,
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
  DateTime? updatedAt;
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
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
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

class SessionMapped {
  SessionMapped({
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.isDeleted,
    required this.idSession,
    required this.stock,
    required this.startDate,
    required this.startTime,
    required this.areaMapped,
    required this.vaccineMapped,
    required this.healthFacilitiesDaoMapped,
  });

  DateTime createdAt;
  String createdBy;
  dynamic updatedAt;
  bool isDeleted;
  int idSession;
  int stock;
  DateTime startDate;
  String startTime;
  AreaMapped areaMapped;
  VaccineMapped vaccineMapped;
  HealthFacilitiesDaoMapped healthFacilitiesDaoMapped;

  factory SessionMapped.fromJson(Map<String, dynamic> json) => SessionMapped(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        isDeleted: json["is_deleted"],
        idSession: json["id_session"],
        stock: json["stock"],
        startDate: DateTime.parse(json["start_date"]),
        startTime: json["start_time"],
        areaMapped: AreaMapped.fromJson(json["area_mapped"]),
        vaccineMapped: VaccineMapped.fromJson(json["vaccine_mapped"]),
        healthFacilitiesDaoMapped: HealthFacilitiesDaoMapped.fromJson(
            json["health_facilities_dao_mapped"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt,
        "is_deleted": isDeleted,
        "id_session": idSession,
        "stock": stock,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "area_mapped": areaMapped.toJson(),
        "vaccine_mapped": vaccineMapped.toJson(),
        "health_facilities_dao_mapped": healthFacilitiesDaoMapped.toJson(),
      };
}

class AreaMapped {
  AreaMapped({
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

  factory AreaMapped.fromJson(Map<String, dynamic> json) => AreaMapped(
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

class HealthFacilitiesDaoMapped {
  HealthFacilitiesDaoMapped({
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.isDeleted,
    required this.idHealthFacilities,
    required this.healthFacilitiesName,
    required this.addressHealthFacilities,
    required this.linkLocation,
    required this.phoneFacilities,
    required this.userMapped,
    required this.categoryMapped,
    required this.areaMapped,
  });

  DateTime createdAt;
  String createdBy;
  dynamic updatedAt;
  bool isDeleted;
  int idHealthFacilities;
  String healthFacilitiesName;
  String addressHealthFacilities;
  String linkLocation;
  String phoneFacilities;
  UserMapped userMapped;
  CategoryMapped categoryMapped;
  AreaMapped areaMapped;

  factory HealthFacilitiesDaoMapped.fromJson(Map<String, dynamic> json) =>
      HealthFacilitiesDaoMapped(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        isDeleted: json["is_deleted"],
        idHealthFacilities: json["id_health_facilities"],
        healthFacilitiesName: json["health_facilities_name"],
        addressHealthFacilities: json["address_health_facilities"],
        linkLocation: json["link_location"],
        phoneFacilities: json["phone_facilities"],
        userMapped: UserMapped.fromJson(json["user_mapped"]),
        categoryMapped: CategoryMapped.fromJson(json["category_mapped"]),
        areaMapped: AreaMapped.fromJson(json["area_mapped"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt,
        "is_deleted": isDeleted,
        "id_health_facilities": idHealthFacilities,
        "health_facilities_name": healthFacilitiesName,
        "address_health_facilities": addressHealthFacilities,
        "link_location": linkLocation,
        "phone_facilities": phoneFacilities,
        "user_mapped": userMapped.toJson(),
        "category_mapped": categoryMapped.toJson(),
        "area_mapped": areaMapped.toJson(),
      };
}

class CategoryMapped {
  CategoryMapped({
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.isDeleted,
    required this.idCategoryFacilities,
    required this.categoryFacilitiesName,
  });

  DateTime createdAt;
  String createdBy;
  dynamic updatedAt;
  bool isDeleted;
  int idCategoryFacilities;
  String categoryFacilitiesName;

  factory CategoryMapped.fromJson(Map<String, dynamic> json) => CategoryMapped(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        isDeleted: json["is_deleted"],
        idCategoryFacilities: json["id_category_facilities"],
        categoryFacilitiesName: json["category_facilities_name"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt,
        "is_deleted": isDeleted,
        "id_category_facilities": idCategoryFacilities,
        "category_facilities_name": categoryFacilitiesName,
      };
}

class VaccineMapped {
  VaccineMapped({
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.isDeleted,
    required this.idVaccine,
    required this.vaccineName,
  });

  DateTime createdAt;
  String createdBy;
  dynamic updatedAt;
  bool isDeleted;
  int idVaccine;
  String vaccineName;

  factory VaccineMapped.fromJson(Map<String, dynamic> json) => VaccineMapped(
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"],
        isDeleted: json["is_deleted"],
        idVaccine: json["id_vaccine"],
        vaccineName: json["vaccine_name"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt,
        "is_deleted": isDeleted,
        "id_vaccine": idVaccine,
        "vaccine_name": vaccineName,
      };
}
