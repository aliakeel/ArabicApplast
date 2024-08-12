import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';

class AuthTextfield extends StatelessWidget {
  final String hint;
  final Color? color;
  final double? width;
  final TextEditingController? tec ;
  const AuthTextfield({super.key, required this.hint, this.color,  this.width , this.tec});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width?? Get.width * 0.6,
      height: 45,
      child: TextField(
        controller: tec,
        cursorColor: black,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: color ?? cyan)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:color?? cyan, width: 2.0),
          ),
        ),
      ),
    );
  }
}
