import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A reusable circular progress indicator with optional center widget.
class CustomProgressCircle extends StatelessWidget {
  final double progress;
  final Color color;
  final Color backgroundColor;
  final double size;
  final double strokeWidth;
  final Widget? center;

  const CustomProgressCircle({
    super.key,
    required this.progress,
    required this.color,
    this.backgroundColor = const Color(0xFFE5E5E5),
    this.size = 80,
    this.strokeWidth = 6,
    this.center,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 80.sp,
          width: 80.sp,
          child: CircularProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: strokeWidth,
          ),
        ),
        if (center != null) center!,
      ],
    );
  }
}


