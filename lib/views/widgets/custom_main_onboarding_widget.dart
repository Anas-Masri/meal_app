import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/constant/app_colors.dart';
import 'package:meal_app/core/constant/app_text_styles.dart';
import 'package:meal_app/views/home_page.dart';
import 'package:meal_app/views/widgets/page_indicator.dart';

class CustomMainOnboardingWidget extends StatelessWidget {
  const CustomMainOnboardingWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.selectedIndex,
      required this.controller});
  final String title;
  final String subTitle;
  final int selectedIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      height: 400.h,
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(48.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32.h),
          SizedBox(
            width: 210.w,
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: AppTextStyles.style32white600,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 250.w,
            child: Text(
              textAlign: TextAlign.center,
              subTitle,
              style: AppTextStyles.style14white400,
            ),
          ),
          SizedBox(height: 36.h),
          PageIndicator(index: selectedIndex),
          const Spacer(),
          selectedIndex == 2
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                  child: Container(
                    width: 62.r,
                    height: 62.r,
                    decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(62.r)),
                    child: Icon(
                      size: 30.r,
                      Icons.arrow_forward,
                      color: AppColor.primaryColor,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));
                        },
                        child: Text(
                          'Skip',
                          style: AppTextStyles.style14white600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.animateToPage(selectedIndex == 0 ? 1 : 2,
                              duration: const Duration(microseconds: 100),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Next',
                          style: AppTextStyles.style14white600,
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
