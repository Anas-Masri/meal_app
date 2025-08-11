import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/db_helper/db_helper.dart';
import 'package:meal_app/model/meal_model.dart';
import 'package:meal_app/views/onboarding.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  DbHelper dbHelper = DbHelper.instance;
  // final prefs = await SharedPreferences.getInstance();
  // print(prefs.getBool(AppConstants.isFirstTimeKey).toString());

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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          );
        },
        child: const Onboarding());
  }
}
