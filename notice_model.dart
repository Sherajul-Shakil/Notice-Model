// To parse this JSON data, do
//
//     final getNoticeModel = getNoticeModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

 GetNoticeModel getNoticeModelFromJson(String str) =>
   GetNoticeModel.fromJson(json.decode(str));
GetNoticeModel getNoticeModelFromJsonUtf(Uint8List str) =>
    GetNoticeModel.fromJson(json.decode(utf8.decode(str)));

String getNoticeModelToJson(GetNoticeModel data) => json.encode(data.toJson());

class GetNoticeModel {
  GetNoticeModel({
    this.message,
    this.errors,
    this.status,
    this.statusCode,
    this.links,
    this.count,
    this.totalPages,
    this.data,
  });

  String? message;
  String? errors;
  String? status;
  int? statusCode;
  Links? links;
  int? count;
  int? totalPages;
  List<Datum>? data;

  factory GetNoticeModel.fromJson(Map<String, dynamic> json) => GetNoticeModel(
        message: json["message"],
        errors: json["errors"],
        status: json["status"],
        statusCode: json["status_code"],
        links: Links.fromJson(json["links"]),
        count: json["count"],
        totalPages: json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors,
        "status": status,
        "status_code": statusCode,
        "links": links!.toJson(),
        "count": count,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'GetNoticeModel{message: $message, errors: $errors, status: $status, statusCode: $statusCode, links: $links, count: $count, data: $data}';
  }
}

class Datum {
  Datum(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.description,
      this.documents,
      this.notifyBy,
      this.isActive,
      this.author,
      this.noticeDate});

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? description;
  String? documents;
  String? notifyBy;
  bool? isActive;
  dynamic author;
  String? noticeDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        title: json["title"],
        description: json["description"],
        documents: json["documents"],
        notifyBy: json["notify_by"],
        isActive: json["is_active"],
        author: json["author"],
        noticeDate: json["notice_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "title": title,
        "description": description,
        "documents": documents,
        "notify_by": notifyBy,
        "is_active": isActive,
        "author": author,
        "notice_date": noticeDate,
      };

  @override
  String toString() {
    return 'Datum{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, documents: $documents, notifyBy: $notifyBy, isActive: $isActive, author: $author , noticeDate: $noticeDate}';
  }
}

class Links {
  Links({
    this.next,
    this.previous,
  });

  String? next;
  String? previous;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: json["next"],
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "previous": previous,
      };

  @override
  String toString() {
    return 'Links{next: $next, previous: $previous}';
  }
}
