import 'package:dynamic_architechture/data/models/user_model.dart';
import 'package:dynamic_architechture/data/repository/repository_details.dart';
import 'package:dynamic_architechture/domain/common_functions/common_function.dart';
import 'package:dynamic_architechture/presentation/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController(text: 'emilys');
  final passwordController = TextEditingController(text: 'emilyspass');
  Future login() async {
    final res = await RepositoryData().login(emailController.text.trim(), passwordController.text.trim());
    // final res = await RepositoryData().getProducts();
    res.fold(
      (l) => Get.snackbar("Error", l, backgroundColor: Colors.red, colorText: Colors.white),
      (r) {
        CommonFucunctions.user.value = userFromJson(r);
        // log(r);
        Get.to(const HomeScreen());
      },
    );
  }
}
