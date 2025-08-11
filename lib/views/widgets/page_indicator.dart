import '../../core/export/exports.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 24.w,
          height: 6.h,
          decoration: BoxDecoration(
              color: index == 0
                  ? AppColor.whiteColor
                  : AppColor.greyIndicatorColor,
              borderRadius: BorderRadius.circular(100)),
        ),
        SizedBox(
          width: 4.w,
        ),
        Container(
          width: 24.w,
          height: 6.h,
          decoration: BoxDecoration(
              color: index == 1
                  ? AppColor.whiteColor
                  : AppColor.greyIndicatorColor,
              borderRadius: BorderRadius.circular(100)),
        ),
        SizedBox(
          width: 4.w,
        ),
        Container(
          width: 24.w,
          height: 6.h,
          decoration: BoxDecoration(
              color: index == 2
                  ? AppColor.whiteColor
                  : AppColor.greyIndicatorColor,
              borderRadius: BorderRadius.circular(100)),
        ),
      ],
    );
  }
}
