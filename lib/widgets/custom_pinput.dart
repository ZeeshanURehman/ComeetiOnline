import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../utils/app_colors.dart';

class CustomPinput extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final Function(String) onCompleted;

  const CustomPinput({
    super.key,
    required this.controller,
    this.length = 4,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      length: length,
      controller: controller,
      defaultPinTheme: PinTheme(
        width: 70.w,
        height: 64.h,
        textStyle: TextStyle(
          fontSize: 24.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.grey),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 70.w,
        height: 64.h,
        textStyle: TextStyle(
          fontSize: 24.sp,
          color: AppColors.green, // Yellow color for focused digit
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.green), // Yellow border
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 70.w,
        height: 64.h,
        textStyle: TextStyle(
          fontSize: 24.sp,
          color: AppColors.black, // Black color for completed digits
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.grey), // Default border
        ),
      ),
      followingPinTheme: PinTheme(
        width: 70.w,
        height: 64.h,
        textStyle: TextStyle(
          fontSize: 24.sp,
          color: AppColors.black, // Black for other digits
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.grey), // Default border
        ),
      ),
      onCompleted: onCompleted,
    );
  }
}
