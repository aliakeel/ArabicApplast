import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/images.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/widgets/appBars/cusotm_appBar.dart';
import 'package:kaleela/widgets/drawer_content/drawer.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          color: purple,
          title: 'Contact us',
        ),
        endDrawer: const DrawerContent(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
                leading: Icon(
                  Icons.email,
                  size: 30.r,
                ),
                title: Text(
                  'contact@alif.com',
                  style: tajawal_medium_black,
                )),
            ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 30.r,
                ),
                title: Text(
                  '+963 998 997 4455',
                  style: tajawal_medium_black,
                )),
            ListTile(
                leading: SvgPicture.asset(WEBSITE, width: 30.r),
                title: Text(
                  'www.aliflearnarabic.com',
                  style: tajawal_medium_black,
                )),
          ],
        )),
      ),
    );
  }
}
