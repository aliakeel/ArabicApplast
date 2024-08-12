import 'package:get/get.dart';
import 'package:kaleela/views/topics/controller.dart';

class TopicsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TopicsController());
  }
}
