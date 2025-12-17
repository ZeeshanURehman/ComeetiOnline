import 'dart:async';
import 'package:comeeti_online/screens/onboarding_views.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  void _navigateToHome(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnboardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Trigger navigation when widget builds
    _navigateToHome(context);

    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              AppImages.logo,
              width: 230.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 60.h),
            const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
