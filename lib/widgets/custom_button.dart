import 'package:flutter/material.dart';

import 'package:dynamic_architechture/core/utils/app_colors.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    // this.isLoading = false,
  });
  RxBool isLoading = false.obs;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      colorBrightness: Brightness.dark,
      height: 56,
      color: AppColors.primaryColor,
      onPressed: !isLoading.value
          ? () async {
              isLoading.value = true;
              try {
                await onTap();
              } finally {
                isLoading.value = false;
              }
            }
          : () {},
      child: Obx(() => Center(
          child: !isLoading.value
              ? Text(text)
              : const CircularProgressIndicator(
                  color: Colors.white,
                ))),
    );
  }
}
