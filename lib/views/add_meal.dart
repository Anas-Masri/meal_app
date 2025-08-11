import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/constant/app_colors.dart';
import 'package:meal_app/core/constant/app_text_styles.dart';
import 'package:meal_app/views/widgets/custom_text_field.dart';

class AddMeal extends StatelessWidget {
  const AddMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 2.w),
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.lightGreyColor),
                            borderRadius: BorderRadius.circular(36.r)),
                        child: const Icon(Icons.arrow_back_ios_new, size: 20)),
                    SizedBox(width: 90.w),
                    Text('AddMeal', style: AppTextStyles.style16black600),
                    const Spacer()
                  ],
                ),
                SizedBox(height: 28.h),
                const CustomTextField(
                    title: 'Breakfast', hintText: 'Meal Name'),
                const CustomTextField(
                    maxLine: 3,
                    title: 'Image URL',
                    hintText:
                        'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg'),
                const CustomTextField(title: 'Rate', hintText: '4.5'),
                const CustomTextField(title: 'Time', hintText: '20 - 30'),
                const CustomTextField(
                    maxLine: 3, title: 'Description', hintText: 'first second'),
                SizedBox(height: 70.h),
                Container(
                  width: 327.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Center(
                    child: Text(
                      'save',
                      style: AppTextStyles.style14white600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}






  // DbHelper dbHelper = DbHelper.instance;

/*  dbHelper.insertMeal(MealModel(
    name: 'burger',
    imageUrl:
        'https://www.allrecipes.com/thmb/UsNtGp9OgIsKw6cPqGQ-CxLmnTE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-72657-best-hamburger-ever-ddmfs-4x3-hero-878e801ab30445988d007461782b3c25.jpg',
    description:
        'A typical burger meal, often referred to as a "burger combo" or "burger meal"',
    rate: 4.5,
    time: '20-30',
  ));
  dbHelper.insertMeal(MealModel(
    name: 'burger',
    imageUrl:
        'https://www.allrecipes.com/thmb/UsNtGp9OgIsKw6cPqGQ-CxLmnTE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-72657-best-hamburger-ever-ddmfs-4x3-hero-878e801ab30445988d007461782b3c25.jpg',
    description: 'A typical burger meal',
    rate: 3.5,
    time: '5-20',
  ));
  dbHelper.insertMeal(MealModel(
    name: 'burger',
    imageUrl:
        'https://www.allrecipes.com/thmb/UsNtGp9OgIsKw6cPqGQ-CxLmnTE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-72657-best-hamburger-ever-ddmfs-4x3-hero-878e801ab30445988d007461782b3c25.jpg',
    description: 'burger combo',
    rate: 5,
    time: '10-20',
  ));
  dbHelper.insertMeal(MealModel(
    name: 'burger',
    imageUrl:
        'https://www.allrecipes.com/thmb/UsNtGp9OgIsKw6cPqGQ-CxLmnTE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-72657-best-hamburger-ever-ddmfs-4x3-hero-878e801ab30445988d007461782b3c25.jpg',
    description:
        'A typical burger meal, often referred to as a "burger combo" or "burger meal"',
    rate: 4,
    time: '15-20',
  ));*/