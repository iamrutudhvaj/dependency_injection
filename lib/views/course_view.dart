import 'package:dependency_injection/controllers/course_controller.dart';
import 'package:dependency_injection/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseView extends GetView<CourseController> {
  final int index;
  CourseView({Key key, this.index}) : super(key: key);

  final HomeController hc = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hc.courseList[index].corTitle),
      ),
      body: Obx(
        () => Container(
          child: Center(
            child: ListTile(
              title: Text(hc.courseList[index].corTitle),
              trailing: IconButton(
                icon: Icon(
                  hc.courseList[index].isLiked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {
                  hc.courseList[index].isLiked
                      ? hc.disLikeCourse(
                          sId: 113,
                          courseId: hc.courseList[index].corId,
                          index: index,
                        )
                      : hc.likeCourse(
                          sId: 113,
                          courseId: hc.courseList[index].corId,
                          index: index,
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
