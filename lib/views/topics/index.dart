import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaleela/data/models/quiz_model.dart';
import 'package:kaleela/data/models/topic_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/levels_content.dart';
import 'package:kaleela/views/topics/widgets/quiz_widget.dart';
import 'package:kaleela/views/topics/widgets/topic_widget.dart';
import 'package:kaleela/widgets/appBars/cusotm_appBar.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({super.key, this.topics, this.quizes});
  final List<TopicModel>? topics;
  final List<QuizModel>? quizes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          color: purple,
          title: 'ALIF',
        ),
        endDrawer: Drawer(),
        body: ListView.builder(
          itemCount: ALPHBETS.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                12.r.verticalSpace,
                TopicWidget(topic: topics![index]),
                12.r.verticalSpace,
                index == 5
                    ? QuizWidget(quiz: [quizes![0], quizes![5], quizes![10]])
                    : const SizedBox(),
                index == 11
                    ? QuizWidget(quiz: [quizes![1], quizes![6], quizes![11]])
                    : const SizedBox(),
                index == 17
                    ? QuizWidget(quiz: [quizes![2], quizes![7], quizes![12]])
                    : const SizedBox(),
                index == 23
                    ? QuizWidget(quiz: [quizes![3], quizes![8], quizes![13]])
                    : const SizedBox(),
                index == 27
                    ? QuizWidget(quiz: [quizes![4], quizes![9], quizes![14]])
                    : const SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
