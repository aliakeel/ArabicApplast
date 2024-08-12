import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/images.dart';
import 'package:kaleela/res/styles.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        30.r.verticalSpace,
        SvgPicture.asset(LOGO, width: 75, color: light_purple),
        15.r.verticalSpace,
        Text(
          'ALIF',
          style: tajawal_xxlarge_light_purple,
        ),
        15.r.verticalSpace,
        ListTile(
          leading: const Icon(Icons.home),
          title: Text('Home', style: tajawal_xSamll_black),
          onTap: () {
            Get.toNamed('/chooseLanguage');
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: Text('Profile', style: tajawal_xSamll_black),
          onTap: () {
            Get.toNamed('/profile');
          },
        ),
        ListTile(
          leading: const Icon(Icons.mail),
          title: Text('Contact us', style: tajawal_xSamll_black),
          onTap: () {
            Get.toNamed('/contactus');
          },
        ),
        ListTile(
          leading: const Icon(Icons.question_mark),
          title: Text('About', style: tajawal_xSamll_black),
          onTap: () {
            Get.toNamed('/about');
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: Text('Log out', style: tajawal_xSamll_black),
          onTap: () {},
        ),
      ],
    );
  }
}
