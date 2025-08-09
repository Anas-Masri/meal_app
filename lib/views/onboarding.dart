import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/constant/app_constants.dart';
import 'package:meal_app/views/widgets/custom_main_onboarding_widget.dart';

import '../core/constant/app_assets.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

int selectedIndex = 0;
PageController controller = PageController(
  initialPage: selectedIndex,
);

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemCount: AppConstants.onboardingList.length,
      itemBuilder: (context, index) {
        return Stack(children: [
          Transform.flip(
            flipX: selectedIndex == 2 ? true : false,
            child: Image.asset(
              height: MediaQuery.of(context).size.height,
              AppAssets.mainImg,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 40.h,
            right: 32.w,
            left: 32.w,
            child: CustomMainOnboardingWidget(
                controller: controller,
                title: AppConstants.onboardingList[selectedIndex]['title'],
                subTitle: AppConstants.onboardingList[selectedIndex]
                    ['subTitle'],
                selectedIndex: selectedIndex),
          ),
        ]);
      },
      onPageChanged: (value) {
        selectedIndex = value;
        setState(() {});
      },
      controller: controller,
    ));
  }
}
