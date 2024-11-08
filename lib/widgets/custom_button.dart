import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

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
    this.backgroundColor = AppColors.green,
    this.innerColor = Colors.transparent,
    this.borderColor = Colors.transparent, // Default to transparent if no border color is provided
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.height = 50.0,
    this.width = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(28)),
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
