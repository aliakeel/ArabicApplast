import 'package:flutter/material.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color color;
  final String? title;
  const CustomAppbar({super.key, required this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null
          ? Text(
              'AppName',
              style: tajawal_large_white,
            )
          : Text(title!, style: tajawal_large_white),
      iconTheme: IconThemeData(color: white),
      backgroundColor: color,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
