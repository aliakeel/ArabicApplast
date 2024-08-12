import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaleela/res/colors.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final String? text;
  final VoidCallback? ontap;
  final TextStyle? textStyle;

  const CustomButton(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.text,
      this.ontap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width ?? 75.r,
        decoration: BoxDecoration(
          color: color ?? cyan,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
            child: Column(
          children: [
            10.r.verticalSpace,
            Text(
              text ?? 'data',
              style: textStyle,
            ),
            10.r.verticalSpace,
          ],
        )),
      ),
    );
  }
}
