import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kaleela/controller/app_storage.dart';
import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/views/lesson/widgets/lesson_pronuncing.dart';
import 'package:kaleela/views/lesson/widgets/lesson_video.dart';
import 'package:kaleela/views/lesson/widgets/lesson_write_2.dart';
import 'package:kaleela/views/lesson/widgets/write_lesson.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:video_player/video_player.dart';

class LessonController extends GetxController {
  RxBool isRecording = false.obs;
  RxBool fileExist = false.obs;

  int progress = 0;

  bool permissionGranted = false;
  Record record = Record();
  AudioPlayer audioPlayer = AudioPlayer();
  String? filePath;
  RxBool isAudioPlaying = false.obs;

  RxBool isVideoPlaying = false.obs;
  RxBool isVideoReady = false.obs;

  playToggle() {
    isVideoPlaying.toggle();
    update();
  }

  fileUpdate() {
    fileExist.toggle();
    print(fileExist);
    update();
  }

  audioPlayToggle() {
    isAudioPlaying.toggle();
    update();
  }

  recordingToggle() {
    isRecording.toggle();
    update();
  }

  displayVideoToggle() {
    isVideoReady.toggle();
    update();
  }

  makeProgress() {
    progress = progress + 25;
    AppStorage.saveInt('progress', progress);
  }

  var points = <Offset>[].obs;

  Future<void> startRecording(String path) async {
    await record.start(path: path);
  }

  Future<void> stopRecording() async {
    filePath = await record.stop();
  }

  RxInt index = 0.obs;

  void navigate(int page) {
    index = page.obs;
    update();
  }

  // Future<void> startRecording() async {
  //   await _recorder!.openRecorder();
  //   await _recorder!.startRecorder(toFile: 'audio.aac');
  // }

  // Future<void> stopRecording() async {
  //   await _recorder!.stopRecorder();
  //   await _recorder!.closeRecorder();
  // }

  // void addPoint(Offset point) {
  //   points.add(point);
  // }

  // void clearPoints() {
  //   points.clear();
  // }
  Future<bool> recordPermission() async {
    var recordPermission = await Permission.microphone.request();
    if (recordPermission.isGranted) {
      permissionGranted = true;
      return true;
    }
    return false;
  }

  initializeVideo(VideoPlayerController videoPlayerController, String name) {
    print('initalized Video');
    videoPlayerController = VideoPlayerController.asset(name)
      ..initialize().then((value) {
        update();
      });
  }

  Future playAuido() async {}

  // @override
  // void onInit() {
  //   playerController = VideoPlayerController.asset(VIDEO)
  //     ..initialize().then((_) {
  //       update();
  //     });
  //   print(VIDEO);
  //   super.onInit();
  // }

  Widget getLessonState(LessonModel lesson) {
    if (lesson.id == 0) {
      return LessonVideo(lesson: lesson);
    } else if (lesson.id == 1) {
      return LessonWrite(lesson: lesson);
    } else if (lesson.id == 2) {
      return LessonWrite2(lesson: lesson);
    }
    return PronuncingLesson(lesson: lesson);
  }
}
