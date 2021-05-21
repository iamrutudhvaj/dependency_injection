import 'package:dependency_injection/bindings/course_binding.dart';
import 'package:dependency_injection/controllers/home_controller.dart';
import 'package:dependency_injection/views/course_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  // final CourseController cc = Get.find<CourseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
      ),
      body: Obx(
        () => Container(
          child: (controller.isCourseListLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.courseList.length,
                  itemBuilder: (context, index) {
                    if (controller.courseList.isNotEmpty) {
                      return ListTile(
                        onTap: () {
                          // cc.getCourseScreenData(courseId: controller.courseList[index].corId, sId: 113);
                          Get.to(
                                  CourseView(
                                    index: index,
                                  ),
                                  binding: CourseBinding())
                              .then((value) {
                            controller.getUpdatedData();
                          });
                        },
                        title: Text(controller.courseList[index].corTitle),
                        trailing: Icon(
                          controller.courseList[index].isLiked ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
        ),
      ),
    );
  }
}
