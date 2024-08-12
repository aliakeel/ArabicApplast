import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/images.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/profile/controller.dart';
import 'package:kaleela/widgets/appBars/cusotm_appBar.dart';
import 'package:kaleela/widgets/drawer_content/drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppbar(
            color: purple,
            title: 'Profile',
          ),
          endDrawer: const Drawer(
            child: DrawerContent(),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: Get.width * 0.9,
                child: Column(
                  children: [
                    40.r.verticalSpace,
                    ClipRRect(
                      child: SvgPicture.asset(
                        GUEST,
                        width: 150.r,
                      ),
                    ),
                    15.r.verticalSpace,
                    Text('username', style: tajawal_medium_black),
                    Text('email@example.com', style: tajawal_medium_black),
                    ListTile(
                        onTap: () {
                          _.showDialog();
                        },
                        title:
                            Text('Edit account', style: tajawal_xSamll_black)),
                    ListTile(
                        title: Text('Change password',
                            style: tajawal_xSamll_black)),
                    ListTile(
                        title: Text('Progress', style: tajawal_xSamll_black)),
                    ListTile(
                        title: Text('Log out', style: tajawal_xSamll_black)),
                    ListTile(
                        title: Text('Delete Account',
                            style: tajawal_xSamll_red_bold)),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
