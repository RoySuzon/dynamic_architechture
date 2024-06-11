import 'dart:developer';

import 'package:dynamic_architechture/presentation/LoginScreen/controller/login_screen_controller.dart';
import 'package:dynamic_architechture/presentation/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dynamic Architechture!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
      enableLog: true,
      logWriterCallback: Logger.write,
      home: const SplashScreen(),
    );
  }
}

class Logger {
  static write(String text, {bool isError = false}) {
    Future.microtask(() => log('**$text . isErro [$isError]'));
  }
}
