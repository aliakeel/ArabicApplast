import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/views/lesson/controller.dart';
import 'package:kaleela/views/lesson/widgets/lesson_pronuncing.dart';
import 'package:kaleela/views/lesson/widgets/lesson_video.dart';
import 'package:kaleela/views/lesson/widgets/lesson_write_2.dart';
import 'package:kaleela/views/lesson/widgets/write_lesson.dart';
import 'package:kaleela/widgets/appBars/cusotm_appBar.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key, this.lesson});
  final LessonModel? lesson;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LessonController>(builder: (_) {
        return Scaffold(
          appBar: CustomAppbar(
            color: purple,
            title: 'Lesson ${_.index.value + 1}',
          ),
          body: () {
            if (_.index.value == 0) {
              return Center(
                child: LessonVideo(
                  lesson: lesson,
                ),
              );
            } else if (_.index.value == 1) {
              return Center(
                child: LessonWrite(lesson: lesson!),
              );
            } else if (_.index.value == 2) {
              return Center(
                child: LessonWrite2(lesson: lesson!),
              );
            } else if (_.index.value == 3) {
              return Center(
                child: PronuncingLesson(lesson: lesson!),
              );
            }
          }(),
          // body: _.index.value == 0
          //     ? LessonVideo(
          //         lesson: lesson,
          //       )
          //     : Center(child: LessonWrite(lesson: lesson!))
          // Center(child: _.getLessonState(lesson!)),
        );
      }),
    );
  }
}
