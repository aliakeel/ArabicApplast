import 'package:get/get.dart';
import 'package:kaleela/views/user_mode/controller.dart';

class UserModeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(UserModeController());
  }
}