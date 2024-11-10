import 'package:comeeti_online/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator; // Validator function
  final bool limitTo10Digits; // Optional flag to limit to 10 digits

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.limitTo10Digits = false, // Default is false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.grey,
      cursorHeight: 20.h,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
        inputFormatters: [
          if (limitTo10Digits)
            LengthLimitingTextInputFormatter(10), // Apply limit if condition is true
          FilteringTextInputFormatter.digitsOnly, // Allow only digits
        ],
        validator: validator, // Add validator here
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: AppColors.grey,
        ),
        filled: true,
        fillColor: AppColors.grey.withOpacity(0.1),
        contentPadding: EdgeInsets.only(top: 10.h, left: 20.w),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.r),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorStyle: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}
