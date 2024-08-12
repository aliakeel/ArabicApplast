import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/data/models/quiz_model.dart';
import 'package:kaleela/data/models/topic_model.dart';
import 'package:kaleela/res/levels_content.dart';

class DataSource {
  static List<TopicModel> levelOneTopics() {
    List<TopicModel> topics = [];
    for (int i = 0; i < ALPHBETS.length; i++) {
      topics.add(
        TopicModel(
          id: i,
          isDone: false,
          letter: ALPHBETS[i],
          level: 1,
          lessons: [
            LessonModel(letter: ALPHBETS[i], id: 0, content: ENG_ALPHBET[i]),
            LessonModel(id: 1, content: 'Write1', letter: ALPHBETS[i]),
            LessonModel(id: 2, content: 'Write2', letter: ALPHBETS[i]),
            LessonModel(id: 3, content: 'Pronunciation', letter: ALPHBETS[i]),
          ],
        ),
      );
    }
    return topics;
  }

  static List<QuizModel> levelOneQuizes() {
    List<QuizModel> quizes = [];
    quizes
        .add(QuizModel(id: 1, letter: QUIZLETTER[0], content: QUIZCONTENT[0]));
    quizes
        .add(QuizModel(id: 2, letter: QUIZLETTER[1], content: QUIZCONTENT[1]));
    quizes
        .add(QuizModel(id: 3, letter: QUIZLETTER[2], content: QUIZCONTENT[2]));
    quizes
        .add(QuizModel(id: 4, letter: QUIZLETTER[3], content: QUIZCONTENT[3]));
    quizes
        .add(QuizModel(id: 5, letter: QUIZLETTER[4], content: QUIZCONTENT[4]));
    return quizes;
  }

  static List<QuizModel> levelOneQuizes2() {
    List<QuizModel> quizes = [];
    quizes
        .add(QuizModel(id: 6, letter: QUIZCONTENT[0], content: QUIZLETTER[0]));
    quizes
        .add(QuizModel(id: 7, letter: QUIZCONTENT[1], content: QUIZLETTER[1]));
    quizes
        .add(QuizModel(id: 8, letter: QUIZCONTENT[2], content: QUIZLETTER[2]));
    quizes
        .add(QuizModel(id: 9, letter: QUIZCONTENT[3], content: QUIZLETTER[3]));
    quizes
        .add(QuizModel(id: 10, letter: QUIZCONTENT[4], content: QUIZLETTER[4]));
    return quizes;
  }

  static List<QuizModel> levelOneQuizes3() {
    List<QuizModel> quizes = [];
    quizes
        .add(QuizModel(id: 11, letter: QUIZCONTENT[0], content: QUIZLETTER[0]));
    quizes
        .add(QuizModel(id: 12, letter: QUIZCONTENT[1], content: QUIZLETTER[1]));
    quizes
        .add(QuizModel(id: 13, letter: QUIZCONTENT[2], content: QUIZLETTER[2]));
    quizes
        .add(QuizModel(id: 14, letter: QUIZCONTENT[3], content: QUIZLETTER[3]));
    quizes
        .add(QuizModel(id: 15, letter: QUIZCONTENT[4], content: QUIZLETTER[4]));
    return quizes;
  }
}
