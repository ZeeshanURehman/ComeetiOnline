import 'dart:async';

import 'package:comeeti_online/screens/dashboard/dashboard_view.dart';
import 'package:comeeti_online/screens/signin/signin_view.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_texts.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_pinput.dart';

class CompleteSignupView extends StatefulWidget {
  const CompleteSignupView({super.key});

  @override
  State<CompleteSignupView> createState() => _CompleteSignupViewState();
}

class _CompleteSignupViewState extends State<CompleteSignupView> {

  final pinController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Listen for complete pin input
    pinController.addListener(() {
      if (pinController.text.length == 4) {
        showVerificationDialog();
      }
    });
  }

  void showVerificationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        startTimer();
        return const CustomDialogBox(
          lottieAnimationPath: 'assets/animations/succes animation.json',
          title: 'Account created Successfully!',
          subtext: 'Please wait...',
          subtext1: 'You will be directed to the homepage',
        );
      },
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pop();
      Get.to(SigninView());
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
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
                  showVerificationDialog();
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
