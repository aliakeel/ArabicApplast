import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/topic_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/topics/controller.dart';
import 'package:kaleela/views/topics/widgets/lesson_widget.dart';

class TopicWidget extends StatelessWidget {
  final TopicModel topic;
  TopicWidget({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    RxBool isExpanded = false.obs;
    return GetBuilder<TopicsController>(builder: (_) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              _.toggleVar(isExpanded);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200.r,
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
                          child: Center(
                              child: Container(
                            width: 50.r,
                            height: 50.r,
                            decoration: BoxDecoration(
                              color: light_purple,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                topic.letter,
                                style: tajawal_medium_white,
                              ),
                            ),
                          )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Topic ${topic.id + 1}',
                              style: tajawal_medium_black,
                            ),
                            // Text(
                            //   letter,
                            //   style: poppins_medium_black,
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 55.r,
                    height: 55.r,
                    decoration: BoxDecoration(
                      color: purple,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        isExpanded.value
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: white,
                        size: 45.r,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          isExpanded.value
              ? SizedBox(
                  child: Column(
                    children: generateChildren(topic.lessons.length),
                  ),
                )
              : SizedBox()
        ],
      );
    });
  }

  List<Widget> generateChildren(int count) {
    return List<Widget>.generate(count, (index) {
      return Column(
        children: [
          12.r.verticalSpace,
          LessonWidget(
            lesson: topic.lessons[index],
          )
        ],
      );
    });
  }
}
