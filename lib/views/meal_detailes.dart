import '../core/export/exports.dart';

class MealDetailes extends StatelessWidget {
  const MealDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      border: Border.all(color: AppColor.lightGreyColor),
                      borderRadius: BorderRadius.circular(36.r)),
                  child: const Icon(Icons.arrow_back_ios_new, size: 20)),
            ),
            SizedBox(width: 90.w),
            Text('AddMeal', style: AppTextStyles.style16black600),
            const Spacer()
          ],
        ),
      ],
    );
  }
}
