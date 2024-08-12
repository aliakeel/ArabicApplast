import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';

class LessonIntro extends StatelessWidget {
  const LessonIntro({super.key, this.lesson, this.pageController});
  final LessonModel? lesson;
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/images/${lesson!.letter}.svg',
            width: 175.r,
            color: red,
          ),
          25.r.verticalSpace,
          Center(
            child: Container(
              width: 250.r,
              height: 250.r,
              decoration: BoxDecoration(
                color: light_purple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Lesson',
                              style: tajawal_samll_white,
                            ),
                            20.r.verticalSpace,
                            Text(
                              '${lesson!.id+1}',
                              style: tajawal_samll_white_bold,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Level', style: tajawal_samll_white),
                            20.r.verticalSpace,
                            Text(
                              'Basics',
                              style: tajawal_xSamll_white_bold,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          60.r.verticalSpace,
          CustomButton(
            color: purple,
            text: 'Start',
            textStyle: tajawal_samll_white_bold,
            width: 150.r,
            ontap: () {
              pageController!.animateToPage(
                1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
          25.r.verticalSpace,
        ],
      ),
    );
  }
}
