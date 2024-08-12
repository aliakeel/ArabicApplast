import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/views/quiz/controller.dart';

class PlayVoice extends StatefulWidget {
  const PlayVoice({super.key, required this.asset});
  final String asset;

  @override
  State<PlayVoice> createState() => PlayVoiceState();
}

class PlayVoiceState extends State<PlayVoice> {
  AudioPlayer audioPlayer = AudioPlayer();
  QuizController quizController = Get.find();
  @override
  void initState() {
    loadAudio();
    super.initState();
  }

  Future loadAudio() async {
    try {
      // await audioPlayer.setAudioSource(
      //     AudioSource.asset('assets/audios/${widget.asset}.mp3'));
      audioPlayer.playerStateStream.listen((playerState) {
        final processingState = playerState.processingState;
        if (processingState == ProcessingState.completed) {
          print("Audio has ended");
          quizController.audioEnded();
          print(audioPlayer.playing);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (_) {
      return Container(
        width: 60.r,
        height: 60.r,
        decoration: BoxDecoration(
          color: light_purple,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: IconButton(
            onPressed: () async {
              print(audioPlayer.playing);
              await audioPlayer.setAudioSource(
                  AudioSource.asset('assets/audios/${widget.asset}.mp3'));

              if (audioPlayer.playing) {
                // _.audioPlayToggle();
                _.audioPause();
                audioPlayer.stop();
              } else if (!audioPlayer.playing) {
                // _.audioPlayToggle();
                _.audioPlaying();
                audioPlayer.play();
              }
            },
            icon: Icon(
              _.isplaying.value ? Icons.pause : Icons.play_arrow,
              size: 40,
              color: white,
            ),
          ),
        ),
      );
    });
  }
}
