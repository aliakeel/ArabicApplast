import 'package:get/get.dart';
import 'package:kaleela/views/auth/controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
