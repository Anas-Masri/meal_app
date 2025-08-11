import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/constant/app_colors.dart';
import 'package:meal_app/core/constant/app_constants.dart';
import 'package:meal_app/core/constant/app_text_styles.dart';
import 'package:meal_app/core/services/validation/validation_service.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLine,
    required this.controller,
  });
  final String title;
  final String hintText;
  final int? maxLine;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        Text(
          title,
          style: AppTextStyles.style14black500,
        ),
        SizedBox(height: 8.h),
        TextFormField(
          validator: ValidationService.requiredField,
          controller: controller,
          maxLines: maxLine ?? 1,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.style14black500,
              border: AppConstants.border,
              enabledBorder: AppConstants.border,
              focusedBorder: AppConstants.border.copyWith(
                  borderSide: BorderSide(color: AppColor.primaryColor))),
        )
      ],
    );
  }
}
