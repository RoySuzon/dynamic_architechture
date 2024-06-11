import 'package:dynamic_architechture/data/repository/repository_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController(text: 'emilys');
  final passwordController = TextEditingController(text: 'emilyspass');
  Future login() async {
    await RepositoryData()
        .login(emailController.text.trim(), passwordController.text.trim());
  }
}
