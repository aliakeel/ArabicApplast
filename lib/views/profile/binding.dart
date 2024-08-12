import 'package:get/get.dart';
import 'package:kaleela/views/profile/controller.dart';

class ProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}