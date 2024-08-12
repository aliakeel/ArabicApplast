import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/levels_content.dart';

class QuizController extends GetxController {
  RxInt index = 0.obs;
  Color color = purple;
  RxBool isCorrect = false.obs;
  Color backgroundColor = white;
  var selectedIndex = (-1).obs;
  var correctIndex = (-1).obs;
  RxBool isChoosen = false.obs;
  RxInt quizNumber = 1.obs;
  double score = 0;
  // final AudioPlayer audioPlayer = AudioPlayer();
  RxBool isplaying = false.obs;

  navigate(int page) {
    index = page.obs;
    update();
  }

  quizNumberToggle() {
    quizNumber += 1;
    update();
  }

  audioPause() {
    isplaying.value = false;
    update();
  }

  audioPlaying() {
    isplaying.value = true;
    update();
  }

  audioEnded() {
    isplaying.value = false;
    update();
  }

  shuffleList(List<String> content) {
    content.shuffle(Random());
    return content;
  }

  updateAnswer(String letter, String choice, int index) {
    if (matchLetters(letter, choice) || matchPronunce(letter, choice)) {
      color = Colors.green[600]!;
      isChoosen = true.obs;
      backgroundColor = Colors.green[600]!;
      selectedIndex.value = index;
      isCorrect = true.obs;
      update();
    } else {
      color = red;
      selectedIndex.value = index;
      backgroundColor = red;
      isChoosen = true.obs;

      update();
    }
  }

  updatePronunce(String letter, String choice, int index) {
    if (matchPronunce(letter, choice)) {
      color = Colors.green[600]!;
      isChoosen = true.obs;
      backgroundColor = Colors.green[600]!;
      selectedIndex.value = index;
      isCorrect = true.obs;
      update();
    } else {
      color = red;
      selectedIndex.value = index;
      backgroundColor = red;
      isChoosen = true.obs;

      update();
    }
  }

  resetQuiz() {
    selectedIndex.value = -1;
    isChoosen.value = false;
    isCorrect.value = false;
    update();
  }

  matchLetters(String letter, String choice) {
    int index = 0;
    for (int i = 0; i < ALPHBETS.length; i++) {
      if (letter == ALPHBETS[i]) {
        index = i;
        break;
      }
    }
    if (choice == ENG_ALPHBET[index]) {
      return true;
    }
    return false;
  }

  matchPronunce(String pronunce, String choice) {
    int index = 0;
    for (int i = 0; i < ENG_ALPHBET.length; i++) {
      if (pronunce == ENG_ALPHBET[i]) {
        index = i;
        break;
      }
    }
    if (choice == ALPHBETS[index]) {
      return true;
    }
    return false;
  }

  // @override
  // void onInit() async {
  //   await audioPlayer.setAudioSource(AudioSource.asset('assets/audios/A.mp3'));
  //   super.onInit();
  // }
}
