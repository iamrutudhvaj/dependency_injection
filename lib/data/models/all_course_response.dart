// To parse this JSON data, do
//
//     final allCourseResponse = allCourseResponseFromMap(jsonString);

import 'dart:convert';

class AllCourseResponse {
  AllCourseResponse({
    this.message,
    this.data,
  });

  String message;
  List<AllCourse> data;

  factory AllCourseResponse.fromJson(String str) => AllCourseResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllCourseResponse.fromMap(Map<String, dynamic> json) => AllCourseResponse(
        message: json["message"],
        data: List<AllCourse>.from(json["data"].map((x) => AllCourse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class AllCourse {
  AllCourse({
    this.corId,
    this.corTitle,
    this.corDetail,
    this.corPrice,
    this.totalStudent,
    this.averageRating,
    this.ratingCount,
    this.corImage,
    this.corVideo,
    this.createdAt,
    this.isLiked,
    this.isPurchase,
    this.facultyId,
    this.facultyName,
  });

  int corId;
  String corTitle;
  String corDetail;
  String corPrice;
  int totalStudent;
  double averageRating;
  int ratingCount;
  String corImage;
  CorVideo corVideo;
  DateTime createdAt;
  bool isLiked;
  bool isPurchase;
  String facultyId;
  FacultyName facultyName;

  factory AllCourse.fromJson(String str) => AllCourse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllCourse.fromMap(Map<String, dynamic> json) => AllCourse(
        corId: json["cor_id"],
        corTitle: json["cor_title"],
        corDetail: json["cor_detail"],
        corPrice: json["cor_price"],
        totalStudent: json["total_student"],
        averageRating: json["average_rating"].toDouble(),
        ratingCount: json["rating_count"],
        corImage: json["cor_image"],
        corVideo: corVideoValues.map[json["cor_video"]],
        createdAt: DateTime.parse(json["created_at"]),
        isLiked: json["is_liked"],
        isPurchase: json["isPurchase"],
        facultyId: json["faculty_id"],
        facultyName: facultyNameValues.map[json["faculty_name"]],
      );

  Map<String, dynamic> toMap() => {
        "cor_id": corId,
        "cor_title": corTitle,
        "cor_detail": corDetail,
        "cor_price": corPrice,
        "total_student": totalStudent,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "cor_image": corImage,
        "cor_video": corVideoValues.reverse[corVideo],
        "created_at": createdAt.toIso8601String(),
        "is_liked": isLiked,
        "isPurchase": isPurchase,
        "faculty_id": facultyId,
        "faculty_name": facultyNameValues.reverse[facultyName],
      };
}

enum CorVideo { PUBLIC_VIDEO_1619759574713_MP4 }

final corVideoValues = EnumValues({"public/video/1619759574713 .mp4": CorVideo.PUBLIC_VIDEO_1619759574713_MP4});

enum FacultyName { DIVYESH_BABARIYA, RUTUDHVAJ_BODAR }

final facultyNameValues = EnumValues({"Divyesh Babariya": FacultyName.DIVYESH_BABARIYA, "Rutudhvaj Bodar": FacultyName.RUTUDHVAJ_BODAR});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
