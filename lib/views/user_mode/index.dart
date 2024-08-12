import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/images.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';

class UserModePage extends StatelessWidget {
  const UserModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.5,
                  color: purple,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ACCOUNT,
                          width: 125.r,
                          color: offwhite,
                        ),
                        40.r.verticalSpace,
                        Text(
                          'New user',
                          style: tajawal_medium_white,
                        ),
                        15.r.verticalSpace,
                        CustomButton(
                          ontap: () {
                            Get.toNamed('/chooseLanguage');
                          },
                          width: 175.r,
                          color: white,
                          text: 'Get Started',
                          textStyle: tajawal_xSamll_purple_bold,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  height: Get.height * 0.5,
                  color: light_purple,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          GUEST,
                          color: offwhite,
                          width: 125.r,
                        ),
                        40.r.verticalSpace,
                        Text(
                          'Existing user',
                          style: tajawal_medium_white,
                        ),
                        15.r.verticalSpace,
                        CustomButton(
                          ontap: () {
                            Get.toNamed('/auth');
                          },
                          width: 175.r,
                          color: white,
                          text: 'Sign in',
                          textStyle: tajawal_xSamll_light_purple_bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
