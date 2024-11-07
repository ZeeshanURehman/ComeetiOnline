import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = Colors.green,
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.height = 50.0,
    this.width = double.infinity,
    this.borderRadius = const BorderRadius.all(Radius.circular(28)),
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
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600,
              fontSize: fontSize.sp,
            ),
          ),
        ),
      ),
    );
  }
}
