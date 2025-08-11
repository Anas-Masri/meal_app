import '../../core/export/exports.dart';

class GridViewItemBuilder extends StatelessWidget {
  const GridViewItemBuilder({
    super.key,
    required this.image,
    required this.time,
    required this.name,
    required this.rate,
  });
  final String image;
  final String time;
  final String name;
  final double rate;
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
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: image,
                width: 137.w,
                height: 106.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
              padding: EdgeInsets.only(left: 8.w),
              alignment: Alignment.centerLeft,
              child: Text(name, style: AppTextStyles.style16black500)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: AppColor.primaryColor,
                ),
                Text(rate.toString(), style: AppTextStyles.style12black500),
                SizedBox(width: 4.w),
                const Spacer(),
                Icon(
                  Icons.watch_later,
                  size: 20,
                  color: AppColor.primaryColor,
                ),
                Text(time, style: AppTextStyles.style12black500),
                SizedBox(width: 4.w),
              ],
            ),
          )
        ],
      ),
    );
  }
}
