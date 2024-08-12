import 'package:get/get.dart';
import 'package:kaleela/controller/app_storage.dart';

class TopicsController extends GetxController {
  RxBool isExpanded = false.obs;

  toggleVar(RxBool variable) {
    variable.toggle();
    update();
  }

  getProgress() async {
    return await AppStorage.getInt('progress');
  }
}
