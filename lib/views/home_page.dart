import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/constant/app_colors.dart';
import 'package:meal_app/core/constant/app_text_styles.dart';
import 'package:meal_app/core/services/db_helper/db_helper.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/views/add_meal.dart';
import '../core/constant/app_assets.dart';
import 'widgets/grid_view_item_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    DbHelper dbHelper = DbHelper.instance;
    dbHelper.getMeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DbHelper dbHelper = DbHelper.instance;

    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddMeal(),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: AppColor.primaryColor, width: 2.sp)),
          width: 60.r,
          height: 60.r,
          child: Icon(
            Icons.add,
            color: AppColor.primaryColor,
            size: 40,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 260.h,
            child: Stack(
              children: [
                Positioned(
                  top: -117,
                  left: -120,
                  child: SizedBox(
                      width: 632.w,
                      height: 346.h,
                      child: Image.asset(
                        width: 632.w,
                        height: 346.h,
                        AppAssets.secondaryImg,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  top: 64.h,
                  left: 43.w,
                  child: SizedBox(
                      width: 175.w,
                      child: Text(
                        'Welcome Add A New Recipe',
                        style: AppTextStyles.style32white600,
                      )),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.w),
            alignment: Alignment.topLeft,
            child: Text('Your Food', style: AppTextStyles.style16black600),
          ),
          SizedBox(height: 25.h),
          FutureBuilder(
            future: dbHelper.getMeals(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.data.isEmpty) {
                return Expanded(
                  child: Container(
                    padding: EdgeInsets.all(50.w),
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      'No meals added yet add new meal',
                      style: AppTextStyles.style24black400,
                    ),
                  ),
                );
              } else {
                List<MealModel> meals = snapshot.data;
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  height: 425.h,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 22.w,
                        mainAxisSpacing: 46.h,
                        childAspectRatio: 3.5 / 4),
                    itemCount: meals.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GridViewItemBuilder(
                          image: meals[index].imageUrl,
                          name: meals[index].name,
                          rate: meals[index].rate,
                          time: meals[index].time);
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
