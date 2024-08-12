import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/widgets/appBars/cusotm_appBar.dart';
import 'package:kaleela/widgets/drawer_content/drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppbar(
            color: purple,
            title: 'About',
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
                    15.verticalSpace,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Welcome to Alif!\n',
                              style: tajawal_medium_black_bold),
                          TextSpan(
                              text:
                                  'At Alif, we believe that learning a new language should be engaging, accessible, and fun. Our mission is to help English speakers learn Arabic in a way that is both effective and enjoyable.',
                              style: tajawal_samll_black),
                        ],
                      ),
                    ),
                    25.r.verticalSpace,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Our Mission\n',
                              style: tajawal_medium_black_bold),
                          TextSpan(
                              text:
                                  'At Alif, we believe that learning a new language should be engaging, accessible, and fun. Our mission is to help English speakers learn Arabic in a way that is both effective and enjoyable.',
                              style: tajawal_samll_black),
                        ],
                      ),
                    ),
                    25.r.verticalSpace,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'What We Offer\n',
                              style: tajawal_medium_black_bold),
                          TextSpan(
                              text:
                                  '1) Interactive Lessons: Our lessons are designed to be interactive and immersive, ensuring that you not only learn Arabic but also retain what you’ve learned. Each lesson is crafted to build your vocabulary, grammar, and conversational skills step by step.\n2) Engaging Content: From basic alphabets to advanced conversation, our content covers a wide range of topics and real-life scenarios. We use multimedia, including audio, video, and quizzes, to make learning engaging and effective.\n3) Personalized Learning: We understand that everyone learns at their own pace. Our app allows you to customize your learning path according to your needs and progress, ensuring a personalized learning experience.\n4) Community Support: Join a vibrant community of learners and native speakers. Participate in forums, group discussions, and practice sessions to enhance your learning experience and gain confidence in your speaking abilities.\n',
                              style: tajawal_samll_black),
                        ],
                      ),
                    ),
                    25.r.verticalSpace,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Why Learn Arabic?\n',
                              style: tajawal_medium_black_bold),
                          TextSpan(
                              text:
                                  'Arabic is one of the most widely spoken languages in the world, with over 300 million native speakers. Learning Arabic opens up a world of opportunities, from understanding rich cultural heritages to enhancing your career prospects. Whether you’re learning for travel, work, or personal growth, Alif is here to support you every step of the way.',
                              style: tajawal_samll_black),
                        ],
                      ),
                    ),
                    15.r.verticalSpace,
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
