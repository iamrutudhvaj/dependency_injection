import 'package:dependency_injection/controllers/course_controller.dart';
import 'package:get/get.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CourseController());
  }
}
