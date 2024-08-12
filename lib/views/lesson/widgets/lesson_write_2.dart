import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/lesson/controller.dart';
import 'package:kaleela/views/lesson/widgets/drawable_widget.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';

class LessonWrite2 extends StatelessWidget {
  const LessonWrite2({
    super.key,
    required this.lesson,
  });
  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              50.r.verticalSpace,
              Text(
                'Write the previous letter',
                style: tajawal_medium_black,
              ),
              40.r.verticalSpace,
              SizedBox(
                width: 350.r,
                height: 325.r,
                child: Center(
                  child: ClipRRect(
                    child: DrawingBoard(
                      image: lesson.letter,
                    ),
                  ),
                ),
              ),
              25.r.verticalSpace,
              CustomButton(
                color: purple,
                text: 'Check',
                width: 150.r,
                ontap: () {
                  _.navigate(3);
                  if (_.progress == 50) {
                    _.makeProgress();
                  }
                  // controller.animateToPage(
                  //   4,
                  //   duration: const Duration(milliseconds: 400),
                  //   curve: Curves.easeInOut,
                  // );
                },
                textStyle: tajawal_samll_white_bold,
              ),
              25.r.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
