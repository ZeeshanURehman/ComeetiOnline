import 'dart:async';

import 'package:comeeti_online/screens/resetPassword/views/reset_password_view.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_pinput.dart';

class ResetPasswordOtpView extends StatefulWidget {
  const ResetPasswordOtpView({super.key});

  @override
  State<ResetPasswordOtpView> createState() => _ResetPasswordOtpViewState();
}

class _ResetPasswordOtpViewState extends State<ResetPasswordOtpView> {

  final pinController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Listen for complete pin input
    pinController.addListener(() {
      if (pinController.text.length == 4) {
        Get.to(ResetPasswordView());
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              80.ht,
              Row(
                children: [
                  Text24(text: 'OTP code verification'),
                ],
              ),
              20.ht,
              Text16(
                text: 'We have sent an OTP code to your email ex@............com . Enter the OTP code below to verify.',
                color: AppColors.grey,
              ),
              90.ht,
              CustomPinput(
                controller: pinController,
                onCompleted: (pin) {
                 Get.to(ResetPasswordView());
                },
              ),
              60.ht,
              Text16(
                text: 'Didn’t receive message?',
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
              20.ht,
              RichText(
                text: TextSpan(
                  text: 'You can resend code in ',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                  ),
                  children: const <TextSpan>[
                    TextSpan(text: '55', style: TextStyle(color: AppColors.green)),
                    TextSpan(text: 's'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
