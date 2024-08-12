import 'package:get/get.dart';
import 'package:kaleela/views/choose_language/controller.dart';

class ChooseLangBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChooseLangController());
  }
}
