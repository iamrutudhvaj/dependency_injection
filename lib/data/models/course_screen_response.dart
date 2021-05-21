// To parse this JSON data, do
//
//     final courseScreenResponse = courseScreenResponseFromMap(jsonString);

import 'dart:convert';

class CourseScreenResponse {
  CourseScreenResponse({
    this.message,
    this.data,
  });

  final String message;
  final Data data;

  factory CourseScreenResponse.fromJson(String str) => CourseScreenResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CourseScreenResponse.fromMap(Map<String, dynamic> json) => CourseScreenResponse(
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    this.corId,
    this.corTitle,
    this.corDetail,
    this.corPrice,
    this.corImage,
    this.corVideo,
    this.isLiked,
    this.totalStudent,
    this.ratingCount,
    this.averageRating,
    this.createdAt,
    this.isPurchase,
    this.facultyName,
  });

  final int corId;
  final String corTitle;
  final String corDetail;
  final String corPrice;
  final String corImage;
  final String corVideo;
  final bool isLiked;
  final int totalStudent;
  final int ratingCount;
  final double averageRating;
  final DateTime createdAt;
  final bool isPurchase;
  final String facultyName;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        corId: json["cor_id"],
        corTitle: json["cor_title"],
        corDetail: json["cor_detail"],
        corPrice: json["cor_price"],
        corImage: json["cor_image"],
        corVideo: json["cor_video"],
        isLiked: json["is_liked"],
        totalStudent: json["total_student"],
        ratingCount: json["rating_count"],
        averageRating: json["average_rating"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        isPurchase: json["isPurchase"],
        facultyName: json["faculty_name"],
      );

  Map<String, dynamic> toMap() => {
        "cor_id": corId,
        "cor_title": corTitle,
        "cor_detail": corDetail,
        "cor_price": corPrice,
        "cor_image": corImage,
        "cor_video": corVideo,
        "is_liked": isLiked,
        "total_student": totalStudent,
        "rating_count": ratingCount,
        "average_rating": averageRating,
        "created_at": createdAt.toIso8601String(),
        "isPurchase": isPurchase,
        "faculty_name": facultyName,
      };
}
