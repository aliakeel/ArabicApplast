import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/quiz_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/quiz/controller.dart';

class ChoicesWidget extends StatefulWidget {
  const ChoicesWidget({super.key, this.letter, this.quiz});
  final QuizModel? quiz;
  final String? letter;

  @override
  State<ChoicesWidget> createState() => _ChoicesWidgetState();
}

class _ChoicesWidgetState extends State<ChoicesWidget> {
  List<String> test = [];
  @override
  // void initState() {
  //   test = [
  //     widget.quiz!.content[0],
  //     widget.quiz!.content[1],
  //     widget.quiz!.content[2],
  //     widget.quiz!.content[3],
  //     widget.quiz!.content[4],
  //     widget.quiz!.content[5],
  //   ];
  //   test.shuffle(Random());
  //   print('init State');
  //   super.initState();
  // }

  void didUpdateWidget(covariant ChoicesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.quiz != oldWidget.quiz) {
      widget.quiz!.id == 5 || widget.quiz!.id == 10 || widget.quiz!.id == 15
          ? initializeLastTest()
          : initializeTest();
    }
  }

  void initializeTest() {
    test = [
      widget.quiz!.content[0],
      widget.quiz!.content[1],
      widget.quiz!.content[2],
      widget.quiz!.content[3],
      widget.quiz!.content[4],
      widget.quiz!.content[5],
    ];
    test.shuffle(Random());
  }

  void initializeLastTest() {
    test = [
      widget.quiz!.content[0],
      widget.quiz!.content[1],
      widget.quiz!.content[2],
      widget.quiz!.content[3],
    ];
    test.shuffle(Random());
  }

  @override
  void initState() {
    widget.quiz!.id == 5 || widget.quiz!.id == 10 || widget.quiz!.id == 15
        ? initializeLastTest()
        : initializeTest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      builder: (_) {
        return Column(
          children: [
            Center(
              child: SizedBox(
                width: Get.width * 0.9,
                height: Get.height * 0.4,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 45,
                    mainAxisExtent: 60,
                    mainAxisSpacing: 45,
                  ),
                  itemCount: widget.quiz!.id == 5 ||
                          widget.quiz!.id == 10 ||
                          widget.quiz!.id == 15
                      ? 4
                      : 6,
                  itemBuilder: (context, index) {
                    if (_.matchLetters(widget.letter!, test[index]) ||
                        _.matchPronunce(widget.letter!, test[index])) {
                      _.correctIndex.value = index;
                    }
                    return Choice(
                      letter: test[index],
                      baseLetter: widget.letter!,
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Choice extends StatelessWidget {
  const Choice(
      {super.key,
      required this.index,
      required this.letter,
      required this.baseLetter});
  final String letter;
  final String baseLetter;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            print(letter);
            if (_.selectedIndex.value == -1) {
              _.updateAnswer(baseLetter, letter, index);
            }
          },
          child: Container(
            width: 150.r,
            height: 50.r,
            decoration: _.correctIndex.value == index
                ? BoxDecoration(
                    border: Border.all(
                        color: _.isChoosen.value ? Colors.green[600]! : purple,
                        width: 2),
                    color: _.isChoosen.value ? Colors.green[600] : white,
                    borderRadius: BorderRadius.circular(30),
                  )
                : BoxDecoration(
                    border: Border.all(
                        color:
                            _.selectedIndex.value == index ? _.color : purple,
                        width: 2),
                    color: _.selectedIndex.value == index
                        ? _.backgroundColor
                        : white,
                    borderRadius: BorderRadius.circular(30),
                  ),
            child: Center(
              child: Text(
                letter,
                style: tajawal_medium_black,
              ),
            ),
          ),
        );
      },
    );
  }
}
