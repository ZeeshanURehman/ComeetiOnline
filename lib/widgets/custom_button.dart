import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_texts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color innerColor;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;
  final double borderWidth;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = AppColors.blue,
    this.innerColor = Colors.transparent,
    this.borderColor = Colors.transparent, // Default to transparent if no border color is provided
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.height = 46.0,
    this.width = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.borderWidth = 1.0, // Default border width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(

          color: backgroundColor,
          borderRadius: borderRadius,
          border: Border.all(color: borderColor, width: borderWidth), // Apply border color and width
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: innerColor,
              borderRadius: borderRadius,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;
  final double height;
  final double borderRadius;
  final bool hasShadow;
  final FontWeight fontWeight;

  const CustomButton1({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.height = 44,
    this.borderRadius = 10,
    this.hasShadow = true,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColors.blue,
          borderRadius: BorderRadius.circular(borderRadius.r),
          boxShadow: hasShadow
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ]
              : [],
        ),
        child: Text16(
          text: text,
          color: textColor ?? AppColors.white,
          fontWeight: fontWeight,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
