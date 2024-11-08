import 'dart:async';
import 'package:comeeti_online/screens/dashboard/dashboard_view.dart';
import 'package:comeeti_online/screens/signin/signin_view.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_texts.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_textfield.dart';
import '../provider/reset_password_provider.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfrmPasswordController = TextEditingController();

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Timer(Duration(seconds: 4), () {
          Navigator.of(context).pop(); // Close the dialog
          Get.to(DashboardView()); // Navigate to the next screen
        });

        return CustomDialogBox(
          lottieAnimationPath: 'assets/animations/succes animation.json',
          title: 'Reset Password Successful!',
          subtext: 'Please wait...',
          subtext1: 'You will be directed to the homepage',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Consumer<ResetPasswordProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                120.ht,
                Text24(text: 'Create new password'),
                20.ht,
                Text16(
                  text: 'Create your new password. If you forgot it, then you have to do forgot password.',
                  fontWeight: FontWeight.w400,
                ),
                24.ht,
                Text16(text: 'New Password'),
                18.ht,
                CustomTextFormField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: !provider.isNewPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      provider.isNewPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: provider.toggleNewPasswordVisibility,
                  ),
                ),
                24.ht,
                Text16(text: 'Confirm New Password'),
                18.ht,
                CustomTextFormField(
                  hintText: 'Password',
                  controller: cnfrmPasswordController,
                  obscureText: !provider.isConfirmPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      provider.isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: provider.toggleConfirmPasswordVisibility,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: CustomButton(
          text: 'Continue',
          onTap: () {
            showConfirmationDialog(context);
          },
        ),
      ),
    );
  }
}
