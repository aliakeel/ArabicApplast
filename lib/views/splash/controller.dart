import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 5), () {
      Get.offAllNamed('/auth');
    });
    super.onInit();
  }
}
