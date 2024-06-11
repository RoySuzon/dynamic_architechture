import '/core/errors/app_exception.dart';
import '/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

mixin ErrorController {
  static customSnackbar({required title, required msg, Color? color}) {
    return Get.snackbar(
      title,
      msg,
      backgroundColor: color,
      colorText: AppColors.colorWhite,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(8.r),
    );
  }

  handleError( error) {
    if (error is BadRequestException) {
      customSnackbar(
          title: "Error",
          msg: BadRequestException().message,
          color: Colors.red);
    } else if (error is FetchDataException) {
      customSnackbar(
          title: "Error", msg: FetchDataException().message, color: Colors.red);
    } else if (error is DataNotFoundException) {
      customSnackbar(
          title: "Error",
          msg: DataNotFoundException().message,
          color: Colors.red);
    } else if (error is ApiNotRespondingException) {
      customSnackbar(
          title: "Error",
          msg: ApiNotRespondingException().message,
          color: Colors.red);
    } else if (error is UnauthorizedException) {
      customSnackbar(
          title: "Error",
          msg: UnauthorizedException().message,
          color: Colors.red);
    }
  }
}
