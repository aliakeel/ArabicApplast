import 'package:get/get.dart';
import 'package:kaleela/views/contact_us/controller.dart';

class ContactUsBidning implements Bindings{
  @override
  void dependencies() {
    Get.put(ContactUsController());
  }
}