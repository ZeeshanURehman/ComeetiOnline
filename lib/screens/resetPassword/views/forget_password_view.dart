import 'package:comeeti_online/screens/resetPassword/views/reset_password_otp_view.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            120.ht,
            Text24(text: 'Reset your password'),
            20.ht,
            Text16(
              text: 'Please enter your email address and we will send an OTP code in the next step to reset your password.',fontWeight: FontWeight.w400,
            ),
            24.ht,
            20.ht,
            Text16(text: 'Email'),
            12.ht,
            CustomTextFormField(hintText: 'Enter your Email',
              controller: emailController,
              prefixIcon: Icon(Icons.email,color: AppColors.grey,size: 18.sp,),
              keyboardType: TextInputType.emailAddress,),
            24.ht,
          ],
        ),
      ),
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: CustomButton(
          text: 'Continue',
          onTap: (){
            Get.to(ResetPasswordOtpView());
          },
        ),
      ),
    );
  }
}
