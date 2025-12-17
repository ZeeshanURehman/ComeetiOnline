import 'package:comeeti_online/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_colors.dart';
import '../utils/app_texts.dart';

class CustomDialogBox extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? subtext;
  final String? subtext1;
  final String? lottieAnimationPath;

  const CustomDialogBox({
    Key? key,
    this.imagePath,
    this.title,
    this.subtext,
    this.subtext1,
    this.lottieAnimationPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      elevation: 0,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (lottieAnimationPath != null) ...[
              Lottie.asset(
                lottieAnimationPath!,
                height: 100.h,
                fit: BoxFit.contain,
                repeat: true,
              ),
              20.ht,
            ],
            if (imagePath != null) ...[
              SvgPicture.asset(
                imagePath!,
                height: 140.h,
                width: 140.w,
                fit: BoxFit.contain,
              ),
              30.ht,
            ],
            if (title != null) ...[
              Text28(
                text: title!,
                fontWeight: FontWeight.w600,
                color: AppColors.blue,
                textAlign: TextAlign.center,
              ),
              30.ht,
            ],
            if (subtext != null) ...[
              Text16(
                text: subtext!,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.center,
              ),
              6.ht,
              if (subtext1 != null)
                Text16(
                  text: subtext1!,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  textAlign: TextAlign.center,
                ),
              10.ht,
            ],
          ],
        ),
      ),
    );
  }
}
