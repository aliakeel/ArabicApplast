import 'package:get/get.dart';
import 'package:kaleela/views/quiz/controller.dart';

class QuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(QuizController());
  }
}
