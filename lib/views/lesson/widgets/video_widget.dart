import 'package:flutter/material.dart';
import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final LessonModel lesson;
  VideoPlayerScreen({required this.lesson});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.lesson.letter == 'ه') {
      _controller = VideoPlayerController.asset(
        'assets/videos/H1.mp4',
      )..initialize().then((_) {
          setState(() {});
        }).catchError((e) {
          print(e);
        });
    } else if (widget.lesson.letter == 'ق') {
      _controller = VideoPlayerController.asset(
        'assets/videos/Kh1.mp4',
      )..initialize().then((_) {
          setState(() {});
        }).catchError((e) {
          print(e);
        });
    } else if (widget.lesson.letter == 'ص') {
      _controller = VideoPlayerController.asset(
        'assets/videos/S1.mp4',
      )..initialize().then((_) {
          setState(() {});
        }).catchError((e) {
          print(e);
        });
    } else if (widget.lesson.letter == 'ذ') {
      _controller = VideoPlayerController.asset(
        'assets/videos/Th1.mp4',
      )..initialize().then((_) {
          setState(() {});
        }).catchError((e) {
          print(e);
        });
    } else {
      _controller = VideoPlayerController.asset(
        'assets/videos/${widget.lesson.content}.mp4',
      )..initialize().then((_) {
          setState(() {});
        }).catchError((e) {
          print(e);
        });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? GestureDetector(
              onTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      children: [
                        VideoPlayer(_controller),
                        _controller.value.isPlaying
                            ? const SizedBox()
                            : Center(
                                child: Icon(
                                Icons.play_arrow,
                                size: 100,
                                color: white,
                              ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}
