import 'package:dynamic_architechture/domain/common_functions/common_function.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(CommonFucunctions.user.value?.email ?? ""),
        ),
        body: const Center(child: Text('This is  Home Screen')));
  }
}
