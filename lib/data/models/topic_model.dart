import 'package:kaleela/data/models/lesson_model.dart';

class TopicModel {
  int id;
  int level;
  String letter;
  bool isDone;
  List<LessonModel> lessons;

  TopicModel({
    required this.id,
    required this.isDone,
    required this.lessons,
    required this.letter,
    required this.level,
  });
}
