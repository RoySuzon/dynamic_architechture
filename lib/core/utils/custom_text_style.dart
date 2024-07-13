import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dynamic_architechture/core/utils/app_colors.dart';

class AppTextStyle {
  // Text Styles

  static get bodyLarge => TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorBlack,
      );

  static get bodyLarge900 => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w900,
        color: AppColors.colorBlack,
      );

  static get bodyLarge700 => TextStyle(
        fontSize: 23.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorDeepBlue,
      );

  static get bodyMedium => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.hintColor,
      );

  static get bodyMedium400 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorGrey,
      );

  static get bodyMediumWhite500 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.colorWhite,
      );

  static get bodyMediumWhite400 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorWhite,
      );

  static get bodyMediumBlack400 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorBlack,
      );

  static get bodyMediumBlue700 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorWhite,
      );

  static get bodyMediumButton700 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.buttonColor2,
      );

  static get bodyMediumTextButton700 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorBlue,
      );

  static get bodyMediumLightBlack300 => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w300,
        color: AppColors.colorLightBlack,
      );

  static get bodyMediumBlack700 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorBlack,
      );

  static get bodySmall => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.hintColor,
      );

  static get bodySmallGrey400 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorGrey,
        decoration: TextDecoration.lineThrough,
      );

  static get bodySmallBlack400 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorBlack,
      );

  static get bodySmallBlack400f15 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorBlack,
      );

  static get bodySmallGrey400S15 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.deepGreyColor,
      );

  static get bodySmallBlack400S15CGrey => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.deepGreyColor,
      );

  static get bodySmallTextGrey400 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorTextGrey,
      );

  static get bodySmallText2Grey400 => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorTextGrey2,
      );

  static get bodySmallText2Grey400s16 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.colorTextGrey2,
      );

  static get bodyTitle700 => TextStyle(
        fontSize: 23.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.colorDeepBlue,
      );

  // Button Styles

  static get buttonStyle => ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.colorWhite),
        minimumSize: WidgetStateProperty.all<Size>(Size(double.infinity, 60.h)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r), // Rounded corners
          ),
        ),
      );

  static get buttonStyle2 => ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.buttonColor),
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.colorWhite),
        minimumSize: WidgetStateProperty.all<Size>(Size(double.infinity, 60.h)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r), // Rounded corners
          ),
        ),
      );
}
