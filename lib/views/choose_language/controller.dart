import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/widgets/appBars/cusotm_appBar.dart';

class ChooseLangController extends GetxController {
  List<String> choices = [
    'Alphabet(Basic)',
    'Alphabet(Shapes)',
    'Long and vowels',
  ];
  String choice = '';

  showDialog(List<String> choices) {
    Get.dialog(Scaffold(
      appBar: CustomAppbar(color: purple ,title: 'ALIF',),
      body: ListView.builder(
        itemCount: choices.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              choice = choices[index];
              update();
              Get.back();
            },
            child: ListTile(
              title: Text(
                choices[index],
                style: tajawal_samll_black,
              ),
            ),
          );
        },
      ),
    ));
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: xSmall,
        timeInSecForIosWeb: 3);
  }
}
