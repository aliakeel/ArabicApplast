import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/dataSource/data_source.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/quiz/controller.dart';
import 'package:kaleela/views/topics/binding.dart';
import 'package:kaleela/views/topics/index.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (_) {
      return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              10.r.verticalSpace,
              Text(
                _.score == 99.0 || _.score == 99.6
                    ? 'Your score is \n 100 / 100'
                    : 'Your score is \n ${_.score.toInt()} / 100',
                style: tajawal_large_black,
                textAlign: TextAlign.center,
              ),
              CustomButton(
                text: 'Back to \n topics',
                textStyle: tajawal_samll_white_bold,
                color: purple,
                width: 150.r,
                ontap: () {
                  Get.offAll(
                      () => TopicsPage(
                            topics: DataSource.levelOneTopics(),
                            quizes: DataSource.levelOneQuizes() +
                                DataSource.levelOneQuizes2() +
                                DataSource.levelOneQuizes3(),
                          ),
                      binding: TopicsBinding());
                },
              ),
              10.r.verticalSpace
            ],
          ),
        ),
      );
    });
  }
}
