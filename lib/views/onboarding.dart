import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/views/home_page.dart';
import 'package:meal_app/views/widgets/custom_main_onboarding_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constant/app_assets.dart';
import '../core/constant/app_constants.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

int selectedIndex = 0;
PageController controller = PageController(initialPage: selectedIndex);

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    checkFirstTime();
  }

  Future<void> checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final isNotFirstTime =
        prefs.getBool(AppConstants.isNotFirstTimeKey) ?? false;

    if (isNotFirstTime) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: AppConstants.onboardingList.length,
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Transform.flip(
                flipX: selectedIndex == 2,
                child: Image.asset(
                  AppAssets.mainImg,
                  height: MediaQuery.of(context).size.height,
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
                  selectedIndex: selectedIndex,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
