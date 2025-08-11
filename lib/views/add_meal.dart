import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/constant/app_colors.dart';
import 'package:meal_app/core/constant/app_text_styles.dart';
import 'package:meal_app/core/services/db_helper/db_helper.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/views/home_page.dart';
import 'package:meal_app/views/widgets/custom_text_field.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    mealNameController.dispose();
    imageController.dispose();
    rateController.dispose();
    timeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void addMeal(
      {required String mealName,
      required String image,
      required String rate,
      required String time,
      required String description}) {
    DbHelper dbHelper = DbHelper.instance;
    dbHelper.insertMeal(MealModel(
        name: mealName,
        imageUrl: image,
        rate: double.parse(rate),
        time: time,
        description: description));
  }

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
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          padding: EdgeInsets.only(right: 2.w),
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColor.lightGreyColor),
                              borderRadius: BorderRadius.circular(36.r)),
                          child:
                              const Icon(Icons.arrow_back_ios_new, size: 20)),
                    ),
                    SizedBox(width: 90.w),
                    Text('AddMeal', style: AppTextStyles.style16black600),
                    const Spacer()
                  ],
                ),
                SizedBox(height: 28.h),
                CustomTextField(
                    controller: mealNameController,
                    title: 'Breakfast',
                    hintText: 'Meal Name'),
                CustomTextField(
                    controller: imageController,
                    maxLine: 3,
                    title: 'Image URL',
                    hintText:
                        'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg'),
                CustomTextField(
                    controller: rateController, title: 'Rate', hintText: '4.5'),
                CustomTextField(
                    controller: timeController,
                    title: 'Time',
                    hintText: '20 - 30'),
                CustomTextField(
                    controller: descriptionController,
                    maxLine: 3,
                    title: 'Description',
                    hintText: 'first second'),
                SizedBox(height: 70.h),
                GestureDetector(
                  onTap: () {
                    addMeal(
                        mealName: mealNameController.text,
                        image: imageController.text,
                        rate: rateController.text,
                        time: timeController.text,
                        description: descriptionController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 327.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(100.r)),
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
