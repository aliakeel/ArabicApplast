import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/lesson/controller.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as p;

class PronuncingLesson extends StatelessWidget {
  const PronuncingLesson({
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
              SvgPicture.asset(
                'assets/images/${lesson.letter}.svg',
                width: 175.r,
                color: red,
              ),
              Text(
                'Pronunce the letter (${lesson.letter})',
                style: tajawal_medium_black,
              ),
              15.r.verticalSpace,
              GestureDetector(
                onTap: () async {
                  if (await Permission.microphone.status ==
                      PermissionStatus.granted) {
                    if (_.isRecording.value) {
                      _.recordingToggle();
                      _.stopRecording();
                      _.fileUpdate();
                    } else {
                      _.recordingToggle();
                      final Directory appDocumentsDir =
                          await getApplicationDocumentsDirectory();
                      final String filePath =
                          p.join(appDocumentsDir.path, 'recording.wav');
                      _.startRecording(filePath);
                    }
                  } else {
                    _.recordPermission();
                  }
                },
                child: Container(
                  width: 60.r,
                  height: 60.r,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: light_purple),
                  child: Icon(
                    _.isRecording.value ? Icons.mic_off : Icons.mic,
                    color: white,
                    size: 35.r,
                  ),
                ),
              ),
              15.r.verticalSpace,
              _.isRecording.value
                  ? Text(
                      'Recording...',
                      style: tajawal_samll_black,
                    )
                  : Text(
                      'Tap to start recording',
                      style: tajawal_samll_black,
                    ),
              _.fileExist.value
                  ? GestureDetector(
                      onTap: () {
                        if (_.audioPlayer.playing) {
                          _.audioPlayer.pause();
                          _.audioPlayToggle();
                        } else {
                          _.audioPlayer.setFilePath(_.filePath!);
                          _.audioPlayer.play();
                          _.audioPlayToggle();
                        }
                      },
                      child: Icon(
                        !_.audioPlayer.playing ? Icons.play_arrow : Icons.pause,
                        size: 75,
                      ),
                    )
                  : SizedBox(),
              15.r.verticalSpace,
              CustomButton(
                color: light_purple,
                text: 'Check',
                width: 150.r,
                ontap: () {
                  if (_.progress == 75) {
                    _.makeProgress();
                  }
                  Get.back();
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
