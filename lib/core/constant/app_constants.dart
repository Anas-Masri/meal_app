import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/constant/app_assets.dart';
import 'package:meal_app/core/constant/app_colors.dart';

class AppConstants {
  static const List<Map<String, dynamic>> onboardingList = [
    {
      'title': 'Save Your Meals Ingredient',
      'subTitle':
          'Add Your Meals and its Ingredients and we will save it for you',
    },
    {
      'title': 'Use Our App The Best Choice',
      'subTitle': 'the best choice for your kitchen do not hesitate',
    },
    {
      'title': 'Our App Your Ultimate Choice',
      'subTitle':
          'All the best restaurants and their top menus are ready for you',
    },
  ];
  static List<String> imageList = [
    AppAssets.imageTest1,
    AppAssets.imageTest2,
    AppAssets.imageTest3,
    AppAssets.imageTest4
  ];
  // static bool isFirstTimeValue = false;
  static const String isNotFirstTimeKey = 'isFirstTimeKey';

  static OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColor.lightGreyColor, width: 1));
}
