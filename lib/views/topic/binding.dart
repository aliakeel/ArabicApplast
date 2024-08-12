import 'package:get/get.dart';
import 'package:kaleela/views/topic/controller.dart';

class TopicBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TopicController());
  }
}
