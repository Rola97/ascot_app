// To parse this JSON data, do
//
//     final homeDataResponse = homeDataResponseFromJson(jsonString);

import 'dart:convert';

HomeDataResponse homeDataResponseFromJson(String str) =>
    HomeDataResponse.fromJson(json.decode(str));

String homeDataResponseToJson(HomeDataResponse data) =>
    json.encode(data.toJson());

class Data {
  int? id;
  String? nameEn;
  String? bodyEn;
  DateTime? createdAt;
  String? bodyAr;
  String? nameAr;

  Data({
    this.id,
    this.nameEn,
    this.bodyEn,
    this.createdAt,
    this.bodyAr,
    this.nameAr,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
        id: json["id"],
        nameEn: json["name_en"],
        bodyEn: json["body_en"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        bodyAr: json["body_ar"],
        nameAr: json["name_ar"],
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "body_en": bodyEn,
        "created_at": createdAt?.toIso8601String(),
        "body_ar": bodyAr,
        "name_ar": nameAr,
      };
}

class HomeDataResponse {
  bool? success;
  bool? error;
  List<Data>? data;
  Meta? meta;
  List<dynamic>? errors;

  HomeDataResponse({
    this.success,
    this.error,
    this.data,
    this.meta,
    this.errors,
  });

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      HomeDataResponse(
        success: json["success"],
        error: json["error"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        errors: json["errors"] == null
            ? []
            : List<dynamic>.from(json["errors"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
        "errors":
            errors == null ? [] : List<dynamic>.from(errors!.map((x) => x)),
      };
}

class Meta {
  int? httpsCode;

  Meta({
    this.httpsCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        httpsCode: json["https_code"],
      );

  Map<String, dynamic> toJson() => {
        "https_code": httpsCode,
      };
}
