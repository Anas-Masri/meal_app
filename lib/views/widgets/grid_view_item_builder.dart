import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/constant/app_colors.dart';
import 'package:meal_app/core/constant/app_text_styles.dart';

class GridViewItemBuilder extends StatelessWidget {
  const GridViewItemBuilder({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 60,
              offset: const Offset(6, 6),
              color: AppColor.blackColor.withOpacity(0.04))
        ],
        borderRadius: BorderRadius.circular(12.r),
        color: AppColor.whiteColor,
      ),
      height: 174.h,
      width: 152.w,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                width: 137.w,
                height: 106.h,
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
              padding: EdgeInsets.only(left: 8.w),
              alignment: Alignment.centerLeft,
              child:
                  Text('Cheese Burger', style: AppTextStyles.style16black500)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColor.primaryColor,
                ),
                Text('4.9', style: AppTextStyles.style12black500),
                SizedBox(width: 4.w),
                const Spacer(),
                Icon(
                  Icons.watch_later,
                  size: 20,
                  color: AppColor.primaryColor,
                ),
                Text(' 20 - 30 ', style: AppTextStyles.style12black500),
                SizedBox(width: 4.w),
              ],
            ),
          )
        ],
      ),
    );
  }
}
