import 'package:get/get.dart';
import 'package:kaleela/views/lesson/controller.dart';

class LessonBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(LessonController());
  }
}