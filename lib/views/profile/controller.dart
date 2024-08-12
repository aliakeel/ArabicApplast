import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/auth/widgets/auth_textField.dart';
import 'package:kaleela/widgets/appBars/cusotm_appBar.dart';

class ProfileController extends GetxController {
  showDialog() {
    Get.dialog(Scaffold(
      appBar: CustomAppbar(
        color: purple,
        title: 'Edit account',
      ),
      body: Center(
        child: SizedBox(
          width: Get.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              45.r.verticalSpace,
              Text(
                'Email',
                style: tajawal_xSamll_black_bold,
              ),
              15.r.verticalSpace,
              AuthTextfield(
                hint: '',
                color: grey,
                width: double.infinity,
              ),
              45.r.verticalSpace,
              Text(
                'Username',
                style: tajawal_xSamll_black_bold,
              ),
              15.r.verticalSpace,
              AuthTextfield(
                hint: '',
                color: grey,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
