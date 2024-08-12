import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/quiz_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/quiz/binding.dart';
import 'package:kaleela/views/quiz/index.dart';
import 'package:kaleela/views/topics/controller.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({super.key, required this.quiz});
  final List<QuizModel> quiz;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopicsController>(builder: (_) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => QuizPage(
                    quiz: [quiz[0] , quiz[1] , quiz[2]],
                  ) , binding: QuizBinding());
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 340.r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 75.r,
                          height: 75.r,
                          decoration: BoxDecoration(
                            color: purple,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 50.r,
                            height: 50.r,
                            decoration: BoxDecoration(
                              color: red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Icon(
                              Icons.my_library_books_outlined,
                              color: white,
                            )),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Let\'s take a Quiz #${quiz[0].id}',
                              style: tajawal_medium_black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
