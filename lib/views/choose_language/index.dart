import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/dataSource/data_source.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/choose_language/controller.dart';
import 'package:kaleela/views/topics/binding.dart';
import 'package:kaleela/views/topics/index.dart';
import 'package:kaleela/widgets/appBars/cusotm_appBar.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';
import 'package:kaleela/widgets/drawer_content/drawer.dart';

class ChooseLanguagePage extends StatelessWidget {
  const ChooseLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: const Drawer(
          child: DrawerContent(),
        ),
        appBar: CustomAppbar(
          color: purple,
          title: 'ALIF',
        ),
        backgroundColor: offwhite,
        body: Center(
          child: SingleChildScrollView(
            child: GetBuilder<ChooseLangController>(builder: (_) {
              return Column(
                children: [
                  40.r.verticalSpace,
                  Text(
                    'My speaking language is',
                    style: tajawal_medium_black,
                  ),
                  30.r.verticalSpace,
                  CustomButton(
                    text: 'English',
                    width: 200.r,
                    color: purple2,
                    ontap: () {
                      _.validation(
                          'More languages are comming soon !', Colors.green[800]!);
                    },
                    textStyle: tajawal_xSamll_white,
                  ),
                  40.r.verticalSpace,
                  Container(
                    width: Get.width,
                    color: light_purple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        40.r.verticalSpace,
                        Text(
                          'I want to learn',
                          style: tajawal_medium_white,
                        ),
                        40.r.verticalSpace,
                        CustomButton(
                          text: 'Arabic',
                          width: 200.r,
                          ontap: () {
                            _.validation('More languages are comming soon !',
                                Colors.green[800]!);
                          },
                          color: offwhite,
                          textStyle: tajawal_xSamll_light_purple,
                        ),
                        40.r.verticalSpace,
                      ],
                    ),
                  ),
                  40.r.verticalSpace,
                  Text(
                    'My level is ',
                    style: tajawal_medium_black,
                  ),
                  30.r.verticalSpace,
                  GetBuilder<ChooseLangController>(builder: (_) {
                    return CustomButton(
                      text: _.choice == '' ? 'Select level' : _.choice,
                      width: 200.r,
                      color: _.choice == '' ? grey : purple,
                      textStyle: _.choice == ''
                          ? tajawal_xSamll_black
                          : tajawal_xSamll_white,
                      ontap: () {
                        _.showDialog(_.choices);
                      },
                    );
                  }),
                  80.r.verticalSpace,
                  GetBuilder<ChooseLangController>(builder: (_) {
                    return CustomButton(
                      ontap: () {
                        for (int i = 0; i < 28; i++) {}
                        if (_.choice == '') {
                          _.validation('Please select a level', red);
                        } else {
                          if (_.choice == _.choices[0]) {
                            Get.to(
                              () => TopicsPage(
                                topics: DataSource.levelOneTopics(),
                                quizes: DataSource.levelOneQuizes() +
                                    DataSource.levelOneQuizes2() +
                                    DataSource.levelOneQuizes3(),
                              ),
                              binding: TopicsBinding(),
                            );
                          }
                        }
                      },
                      width: 200.r,
                      text: 'Continue',
                      color: light_purple,
                      textStyle: tajawal_xSamll_white,
                    );
                  }),
                  40.r.verticalSpace,
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
