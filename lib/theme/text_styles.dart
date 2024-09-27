import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';

class TextStyles {
  static TextStyle get title => TextStyle(
      color: ColorName.primaryColor,
      fontFamily: FontFamily.merriweather,
      fontWeight: FontWeight.w900,
      fontSize: 16.sp);

  static TextStyle get more => TextStyle(
      color: ColorName.strokeColor,
      fontFamily: FontFamily.mulish,
      fontWeight: FontWeight.normal,
      fontSize: 10.sp);

  static TextStyle get error => TextStyle(
      color: ColorName.errorTextColor,
      fontFamily: FontFamily.mulish,
      fontWeight: FontWeight.normal,
      fontSize: 10.sp);

  static TextStyle get movieTitle => TextStyle(
      color: ColorName.blackColor,
      fontFamily: FontFamily.mulish,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static TextStyle get castName => TextStyle(
      color: ColorName.blackColor,
      fontFamily: FontFamily.mulish,
      fontWeight: FontWeight.normal,
      fontSize: 12.sp);

  static TextStyle get movieDetailedTitle => TextStyle(
      color: ColorName.blackColor,
      fontFamily: FontFamily.mulish,
      fontWeight: FontWeight.bold,
      fontSize: 20.sp);

  static TextStyle get play => TextStyle(
      color: ColorName.whiteColor,
      fontFamily: FontFamily.mulish,
      fontWeight: FontWeight.bold,
      fontSize: 14.sp);

  static TextStyle get rating => TextStyle(
      color: ColorName.ratingColor,
      fontFamily: FontFamily.mulish,
      fontWeight: FontWeight.normal,
      fontSize: 12.sp);

  static TextStyle get dateRelease => TextStyle(
      color: ColorName.blackColor,
      fontFamily: FontFamily.mulish,
      fontWeight: FontWeight.normal,
      fontSize: 12.sp);

  static TextStyle get tag => TextStyle(
      color: ColorName.tagTextColor,
      fontFamily: FontFamily.mulish,
      fontWeight: FontWeight.bold,
      fontSize: 10.sp);
}
