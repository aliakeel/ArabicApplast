import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kaleela/data/constant/api_endpoints.dart';
import 'package:kaleela/res/colors.dart';
import 'package:kaleela/res/styles.dart';

class AuthController extends GetxController {
  RxBool login = true.obs;

  loginRequest(String email, String password) async {
    final response = await http
        .post(Uri.parse(LOGIN), body: {'email': email, 'password': password});
    final js = jsonDecode(response.body);
    print(js);
    if (js != "the user is not exists!") {
      return js;
    } else {
      validation(js, red);
    }
  }

  signupRequest(String email, String password, String userName) async {
    try {
      final response = await http.post(Uri.parse(SIGNUP), body: {
        'first_name': userName,
        'last_name': 'test',
        'email': email,
        'password': password
      });
      print(response.body);
      final js = jsonDecode(response.body);
      if (response.statusCode == 200) {
        loginRequest(email, password);
      } else {
        validation(js, red);
      }
    } catch (e) {
      print(e);
      validation('$e',red);
    }
  }

  loginToggle() {
    login.toggle();
    update();
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: xSmall,
        timeInSecForIosWeb: 3);
  }
}
