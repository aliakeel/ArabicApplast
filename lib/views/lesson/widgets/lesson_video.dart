import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/lesson/controller.dart';
import 'package:kaleela/views/lesson/widgets/lesson_intro.dart';
import 'package:kaleela/views/lesson/widgets/video_widget.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';

class LessonVideo extends StatelessWidget {
  const LessonVideo({
    super.key,
    this.lesson,
  });
  final LessonModel? lesson;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return GetBuilder<LessonController>(builder: (_) {
      return PageView(
        controller: pageController,
        children: [
          LessonIntro(
            lesson: lesson,
            pageController: pageController,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/${lesson!.letter}.svg',
                  color: red,
                  width: 175.r,
                ),
                Text(
                  'This is the letter ',
                  style: tajawal_medium_black,
                ),
                25.r.verticalSpace,
                Text(
                  '${lesson!.letter} / ${lesson!.content}',
                  style: tajawal_medium_black,
                ),
                25.r.verticalSpace,
                VideoPlayerScreen(
                  lesson: lesson!,
                ),
                50.r.verticalSpace,
                CustomButton(
                  text: 'Got it',
                  color: light_purple,
                  textStyle: tajawal_samll_white_bold,
                  width: 150.r,
                  ontap: () {
                    _.navigate(1);
                    if (_.progress == 0) {
                      _.makeProgress();
                    }
                  },
                ),
                25.r.verticalSpace,
              ],
            ),
          ),
        ],
      );
    });
  }
}
