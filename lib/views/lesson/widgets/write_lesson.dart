import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kaleela/data/models/lesson_model.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/lesson/controller.dart';
import 'package:kaleela/views/lesson/widgets/drawable_widget.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';
import 'package:tflite_v2/tflite_v2.dart';

const Map ALPHBETS = {
  'أ': 1,
  'ب': 2,
  'ت': 21,
  'ث': 23,
  'ج': 9,
  'ح': 7,
  'خ': 11,
  'د': 4,
  'ذ': 22,
  'ر': 16,
  'ز': 27,
  'س': 18,
  'ش': 19,
  'ص': 17,
  'ض': 3,
  'ط': 20,
  'ظ': 26,
  'ع': 0,
  'غ': 6,
  'ف': 5,
  'ق': 15,
  'ك': 10,
  'ل': 12,
  'م': 13,
  'ن': 14,
  'ه': 8,
  'و': 24,
  'ي': 25
};

class LessonWrite extends StatelessWidget {
  LessonWrite({super.key, required this.lesson});
  final LessonModel lesson;
  final GlobalKey<DrawingBoardState> drawingBoardKey =
      GlobalKey<DrawingBoardState>();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   loadmodel().then((value) {
  //     setState(() {});
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    loadmodel();
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
                'Write the letter (${lesson.letter})',
                style: tajawal_medium_black,
              ),
              40.r.verticalSpace,
              SizedBox(
                width: 350.r,
                height: 325.r,
                child: Center(
                  child: ClipRRect(
                    child: DrawingBoard(
                        key: drawingBoardKey, image: lesson.letter, hint: true),
                  ),
                ),
              ),
              25.r.verticalSpace,
              CustomButton(
                color: purple,
                text: 'Check',
                width: 150.r,
                ontap: () {
                  _processDrawing(context, () {
                    _.navigate(2);
                  });

                  if (_.progress == 25) {
                    _.makeProgress();
                  }
                  // controller.animateToPage(
                  //   3,
                  //   duration: const Duration(milliseconds: 400),
                  //   curve: Curves.easeInOut,
                  // );
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

  Uint8List preprocessImage(Uint8List imageBytes) {
    img.Image? image = img.decodeImage(imageBytes);
    img.Image resizedImage = img.copyResize(image!, width: 64, height: 64);

    // Convert to grayscale if required
    img.Image grayscaleImage = img.grayscale(resizedImage);

    // Convert to byte array
    Uint8List input = grayscaleImage.getBytes(format: img.Format.luminance);

    // Normalize the image
    Float32List float32Input = Float32List(input.length);
    for (int i = 0; i < input.length; i++) {
      float32Input[i] = input[i] / 255.0;
    }

    return float32Input.buffer.asUint8List();
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/ml_model/optimized_arabic_character_cnn_model.tflite",
      labels: "assets/ml_model/labels.txt",
    );
  }

  void _processDrawing(context, navTo) async {
    RenderRepaintBoundary boundary = drawingBoardKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Preprocess the image
    Uint8List input = preprocessImage(pngBytes);

    // Run the model
    var recognitions = await Tflite.runModelOnBinary(
      binary: input,
      numResults: 28,
    );

    //// TODO check if the recognizedLetter the same as the lesson letter
    var result = checkIfDrawnCorrect(ALPHBETS[lesson.letter], recognitions);
    if (result) {
      showBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.white,
              height: 200,
              child: Center(
                child: Column(
                  children: [
                    Text('Excellent'),
                    ElevatedButton(
                        onPressed: () {
                          navTo();
                          Navigator.pop(context);
                        },
                        child: Text("next"))
                  ],
                ),
              ),
            );
          });
    }
    if (!result) {
      showBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.white,
              height: 200,
              child: Center(
                child: Column(
                  children: [
                    Text('not correct'),
                    ElevatedButton(
                        onPressed: () {
                          // drawingBoardKey.cur!.drawingPoints.clear();
                          Navigator.pop(context);
                          drawingBoardKey.currentState?.drawingPoints.clear();
                        },
                        child: Text("try again"))
                  ],
                ),
              ),
            );
          });
    }
    // setState(() {
    //   _recognitions = recognitions;
    //   print("Recognized Letter: ");
    //   print(_recognitions);
    //   try {
    //     String recognizedLetter = _recognitions[0]['label'];
    //     print("Recognized Letter: $recognizedLetter");
    //     v = recognizedLetter;
    //   } catch (e) {
    //     print("No Letter has Recognized!");
    //   }
    // });
  }

  checkIfDrawnCorrect(letterNumber, recognitions) {
    print(recognitions);
    // String recognizedLetter = "";
    // if (recognitions != null && recognitions.length > 0)
    //   recognizedLetter = recognitions![0];
    for (var rec in recognitions) {
      if (letterNumber == rec["index"]) {
        return true;
      }
    }
    return false;
  }
}
