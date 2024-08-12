import 'package:get/get.dart';
import 'package:kaleela/views/about/controller.dart';

class AboutBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AboutController());
  }
}
