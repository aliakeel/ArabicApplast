import 'package:get/get.dart';
import 'package:kaleela/views/splash/controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(SplashController());
  }
}