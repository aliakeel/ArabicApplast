import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/quiz_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/views/quiz/controller.dart';
import 'package:kaleela/views/quiz/widgets/multiple_choices_quiz.dart';
import 'package:kaleela/views/quiz/widgets/score_widget.dart';
import 'package:kaleela/views/quiz/widgets/voice_quiz.dart';
import 'package:kaleela/widgets/appBars/cusotm_appBar.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key, this.quiz});
  final List<QuizModel>? quiz;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (_) {
      return Scaffold(
          appBar: CustomAppbar(
            color: purple,
            title: 'Quiz #${quiz![0].id}',
          ),
          body: () {
            if (quiz![0].id != 5 || quiz![1].id != 10 || quiz![2].id != 15) {
              if (_.index.value == 0) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 0,
                );
              } else if (_.index.value == 1) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 1,
                );
              } else if (_.index.value == 2) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 2,
                );
              } else if (_.index.value == 3) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 3,
                );
              } else if (_.index.value == 4) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 4,
                );
              } else if (_.index.value == 5) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 5,
                );
              } else if (_.index.value == 6) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 0,
                );
              } else if (_.index.value == 7) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 1,
                );
              } else if (_.index.value == 8) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 2,
                );
              } else if (_.index.value == 9) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 3,
                );
              } else if (_.index.value == 10) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 4,
                );
              } else if (_.index.value == 11) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 5,
                );
              } else if (_.index.value == 12) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 0,
                );
              } else if (_.index.value == 13) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 1,
                );
              } else if (_.index.value == 14) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 2,
                );
              } else if (_.index.value == 15) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 3,
                );
              } else if (_.index.value == 16) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 4,
                );
              } else if (_.index.value == 17) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 5,
                );
              } else if (_.index.value == 18) {
                return const ScoreWidget();
              }
            } else {
              if (_.index.value == 0) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 0,
                );
              } else if (_.index.value == 1) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 1,
                );
              } else if (_.index.value == 2) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 2,
                );
              } else if (_.index.value == 3) {
                return MultipleChoicesQuiz(
                  quiz: quiz![0],
                  index: 3,
                );
              } else if (_.index.value == 4) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 0,
                );
              } else if (_.index.value == 5) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 1,
                );
              } else if (_.index.value == 6) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 2,
                );
              } else if (_.index.value == 7) {
                return MultipleChoicesQuiz(
                  quiz: quiz![1],
                  index: 3,
                );
              } else if (_.index.value == 8) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 0,
                );
              } else if (_.index.value == 9) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 1,
                );
              } else if (_.index.value == 10) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 2,
                );
              } else if (_.index.value == 11) {
                return VoiceQuiz(
                  quiz: quiz![2],
                  index: 3,
                );
              } else if (_.index.value == 12) {
                return const ScoreWidget();
              }
            }
          }());
    });
  }
}
