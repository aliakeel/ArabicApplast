import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/quiz_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/quiz/controller.dart';
import 'package:kaleela/views/quiz/widgets/choices.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';

class MultipleChoicesQuiz extends StatelessWidget {
  const MultipleChoicesQuiz({super.key, this.quiz, this.index});
  final QuizModel? quiz;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // IconButton(onPressed: (){
            //   print(quiz!.id);
            // }, icon:Icon(Icons.abc)),
            Text(
              quiz!.id == 10 || quiz!.id == 5 || quiz!.id == 15
                  ? '${_.quizNumber} / 12'
                  : '${_.quizNumber} / 18',
              style: tajawal_samll_black,
            ),
            Text(
              'Choose the correct letter',
              style: tajawal_large_black,
            ),
            Text(
              quiz!.letter[index!],
              style: tajawal_large_black,
            ),
            25.r.verticalSpace,
            ChoicesWidget(
              quiz: quiz,
              letter: quiz!.letter[index!],
            ),
            _.selectedIndex.value != -1
                ? Text(
                    _.isCorrect.value
                        ? 'Correct answer , Good job!'
                        : 'Wrong answer',
                    style: tajawal_medium_black,
                  )
                : const SizedBox(),
            40.r.verticalSpace,
            CustomButton(
              color: _.selectedIndex.value == -1 ? Colors.grey : light_purple,
              width: 150,
              text: 'Next',
              textStyle: tajawal_samll_white_bold,
              ontap: () {
                if (_.isCorrect.value) {
                  _.score += 5.5;
                }
                if (_.selectedIndex.value != -1) {
                  _.resetQuiz();
                  _.navigate(_.index.value + 1);
                  _.quizNumberToggle();
                }
              },
            ),
            25.r.verticalSpace
          ],
        ),
      );
    });
  }
}
