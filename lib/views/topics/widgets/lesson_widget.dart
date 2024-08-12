import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/lesson/binding.dart';
import 'package:kaleela/views/lesson/controller.dart';
import 'package:kaleela/views/lesson/index.dart';

class LessonWidget extends StatelessWidget {
  LessonWidget({super.key, required this.lesson});
  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    final LessonController lessonController = Get.put(LessonController());
    return GestureDetector(
      onTap: () {
        lessonController.index.value = lesson.id;
        Get.to(
            () => LessonPage(
                  lesson: lesson,
                ),
            binding: LessonBinding());
      },
      child: SizedBox(
        width: Get.width * 0.75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60.r,
                    height: 60.r,
                    decoration: BoxDecoration(
                      color: offwhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Container(
                        width: 35.r,
                        height: 35.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: light_purple,
                        ),
                        child: Center(
                          child: Text(
                            lesson.letter,
                            style: tajawal_samll_white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Lesson ${lesson.id + 1}',
                    style: tajawal_samll_black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
