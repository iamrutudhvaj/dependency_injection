import 'package:dependency_injection/data/models/all_course_response.dart';
import 'package:dependency_injection/data/server_communicator/server_communicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var courseList = List<AllCourse>.empty(growable: true).obs;
  final isCourseListLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getCourseData();
    // update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void getCourseData() {
    try {
      ServerProvider().getAllCourse(sId: 113).then((response) {
        isCourseListLoading(false);
        courseList.addAll(response.data);
      }, onError: (e) {
        isCourseListLoading(false);
        showSnackBar(title: "Error", message: e, backgroundColor: Colors.red);
      });
    } catch (e) {
      isCourseListLoading(false);
      showSnackBar(title: "Error", message: e, backgroundColor: Colors.red);
    }
  }

  void getUpdatedData() async {
    try {
      // ServerProvider().getAllCourse(sId: 113).then((response) {
      //   courseList = courseList.addAll(response.data);
      // }, onError: (e) {
      //   showSnackBar(title: "Error", message: e, backgroundColor: Colors.red);
      // });
      var response = await ServerProvider().getAllCourse(sId: 113);
      courseList.value = response.data;
    } catch (e) {
      showSnackBar(title: "Error", message: e, backgroundColor: Colors.red);
    }
  }

  void disLikeCourse({int sId, int courseId, int index}) {
    courseList[index].isLiked = !courseList[index].isLiked;
    print("${courseList[index].isLiked} disliked");
    ServerProvider().disLikeCourse(sId: sId, courseId: courseId);
  }

  void likeCourse({int sId, int courseId, int index}) {
    courseList[index].isLiked = !courseList[index].isLiked;
    print("${courseList[index].isLiked} liked");
    ServerProvider().likeCourse(sId: sId, courseId: courseId);
  }

  showSnackBar({String title, String message, Color backgroundColor}) {
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM, backgroundColor: backgroundColor, colorText: Colors.white);
  }
}
