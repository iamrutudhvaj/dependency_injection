import 'package:get/get.dart';

class CourseController extends GetxController {
  // final courseScreenResponse = CourseScreenResponse().obs;
  // final isCourseScreenDataLoading = true.obs;
  final sId = 0.obs;
  final courseId = 0.obs;

  // HomeController hc = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
  }

  // void getCourseScreenData({int sId, int courseId}) async {
  //   try {
  //     ServerProvider().getCourseDetails(sId: sId, courseId: courseId).then((response) {
  //       isCourseScreenDataLoading(false);
  //       courseScreenResponse.value = response;
  //     }, onError: (e) {
  //       isCourseScreenDataLoading(false);
  //       showSnackBar(title: "Error", message: e, backgroundColor: Colors.red);
  //     });
  //   } catch (e) {
  //     isCourseScreenDataLoading(false);
  //     showSnackBar(title: "Error", message: e, backgroundColor: Colors.red);
  //   }
  // }

  // showSnackBar({String title, String message, Color backgroundColor}) {
  //   Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM, backgroundColor: backgroundColor, colorText: Colors.white);
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
