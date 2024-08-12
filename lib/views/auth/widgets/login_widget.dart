import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';
import 'package:kaleela/views/auth/controller.dart';
import 'package:kaleela/views/auth/widgets/auth_textField.dart';
import 'package:kaleela/widgets/buttons/custom_button.dart';

class AuthWidget extends StatelessWidget {
  final bool isLoging;
  const AuthWidget({super.key, required this.isLoging});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController Rpassword = TextEditingController();
    TextEditingController Remail = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    return isLoging
        ? GetBuilder<AuthController>(builder: (_) {
            return Container(
              width: Get.width * 0.85,
              decoration: BoxDecoration(
                color: offwhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  15.r.verticalSpace,
                  Text(
                    'Login',
                    style: tajawal_samll_black,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Email',
                    tec: email,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Password',
                    tec: password,
                  ),
                  15.r.verticalSpace,
                  CustomButton(
                    height: 45,
                    text: 'Login',
                    color: light_purple,
                    width: Get.width * 0.6,
                    ontap: () {
                      Get.toNamed('/chooseLanguage');
                      // print('object');
                      // _.loginRequest(email.text, password.text);
                    },
                    textStyle: tajawal_xSamll_white_bold,
                  ),
                  15.r.verticalSpace,
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Divider(
                      thickness: 2,
                      color: black,
                    ),
                  ),
                  15.r.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                        style: tajawal_xSamll_black,
                      ),
                      GestureDetector(
                        onTap: () {
                          _.loginToggle();
                        },
                        child: Text(
                          ' Sign up',
                          style: tajawal_xSamll_black_bold_underlined,
                        ),
                      ),
                    ],
                  ),
                  15.r.verticalSpace,
                ],
              ),
            );
          })
        : GetBuilder<AuthController>(builder: (_) {
            return Container(
              width: Get.width * 0.85,
              decoration: BoxDecoration(
                color: offwhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  15.r.verticalSpace,
                  Text(
                    'Sign up',
                    style: tajawal_samll_black,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Username',
                    tec: username,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Email',
                    tec: Remail,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Password',
                    tec: Rpassword,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Confirm Password',
                    tec: confirmPassword,
                  ),
                  15.r.verticalSpace,
                  CustomButton(
                    color: light_purple,
                    height: 45,
                    text: 'Sign up',
                    width: Get.width * 0.6,
                    textStyle: tajawal_xSamll_white_bold,
                    ontap: () {
                      Get.toNamed('/chooseLanguage');
                      // if (confirmPassword.text == Rpassword.text) {
                      //   _.signupRequest(
                      //       email.text, password.text, username.text);
                      // } else {
                      //   _.validation(
                      //       'Password confirmation doesn\'t match', red);
                      // }
                    },
                  ),
                  15.r.verticalSpace,
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Divider(
                      thickness: 2,
                      color: black,
                    ),
                  ),
                  15.r.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: tajawal_xSamll_black,
                      ),
                      GestureDetector(
                        onTap: () {
                          _.loginToggle();
                        },
                        child: Text(
                          ' Login',
                          style: tajawal_xSamll_black_bold_underlined,
                        ),
                      ),
                    ],
                  ),
                  15.r.verticalSpace,
                ],
              ),
            );
          });
  }
}
