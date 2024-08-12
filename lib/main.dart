import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/binding.dart';
import 'package:kaleela/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(415, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          initialBinding: InitBinding(),
          getPages: AppRouting.routes(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          initialRoute: '/splashPage',
        );
      },
    );
  }
}
