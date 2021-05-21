import 'package:dependency_injection/data/models/all_course_response.dart';
import 'package:dependency_injection/data/models/course_screen_response.dart';
import 'package:dio/dio.dart';

class ServerProvider {
  static const String baseURL = "https://kurminfotech.in/edutech/";

  Future<Dio> getDio() async {
    var options = BaseOptions(
      baseUrl: baseURL + 'api/',
      validateStatus: (status) {
        return status < 500;
      },
      responseType: ResponseType.json,
      followRedirects: false,
    );
    Dio dio = Dio(options);

    return dio;
  }

  Future<AllCourseResponse> getAllCourse({int sId}) async {
    FormData formData = new FormData.fromMap({"s_id": sId});
    Dio dio = await getDio();
    Response response = await dio.post("ListAllAndCategoriesWiseData", data: formData);
    try {
      final allCourseResponse = AllCourseResponse.fromJson(response.data);
      return allCourseResponse;
    } catch (error) {
      AllCourseResponse allCourseResponse = AllCourseResponse(message: "Parsing Error!");
      return allCourseResponse;
    }
  }

  Future<CourseScreenResponse> getCourseDetails({int courseId, sId}) async {
    FormData formData = new FormData.fromMap({"s_id": sId, "cor_id": courseId});
    Dio dio = await getDio();
    Response response = await dio.post("courseScreenData", data: formData);
    try {
      final courseScreenResponse = CourseScreenResponse.fromJson(response.data);
      return courseScreenResponse;
    } catch (e) {
      CourseScreenResponse courseScreenResponse = CourseScreenResponse(message: "Parsing Error!");
      return courseScreenResponse;
    }
  }

  Future<void> likeCourse({int courseId, sId}) async {
    FormData formData = new FormData.fromMap({"cor_id": courseId, "s_id": sId});
    Dio dio = await getDio();

    Response response = await dio.post("LikeCource", data: formData);
    if (response != null) {
      print("Like Course");
    }
  }

  Future<void> disLikeCourse({int courseId, sId}) async {
    FormData formData = new FormData.fromMap({"cor_id": courseId, "s_id": sId});
    Dio dio = await getDio();
    print("Dislike Course");
    Response response = await dio.post("disLike", data: formData);
    if (response != null) {
      print("Dislike Course");
    }
  }
}
