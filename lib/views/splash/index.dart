import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/images.dart';
import 'package:kaleela/res/styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: purple,
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: Get.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  120.r.verticalSpace,
                  Text(
                    'Learn Arabic the right way',
                    style: tajawal_large_white,
                    textAlign: TextAlign.center,
                  ),
                  20.r.verticalSpace,
                  Text(
                    'تعلم العربية',
                    style: tajawal_large_white,
                  ),
                  75.r.verticalSpace,
                  SvgPicture.asset(
                    LOGO,
                    height: 200.r,
                    color: Color.fromRGBO(226, 187, 233, 1),
                  ),
                  50.r.verticalSpace,
                  Text('ALIF', style: tajawal_large_white),
                  Text('لغتي العربية', style: tajawal_large_white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
