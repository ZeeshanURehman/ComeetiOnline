import 'package:comeeti_online/screens/signin/signin_view.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final PageController _pageController = PageController();

  final List<_OnboardData> _pages = [
    _OnboardData(
      image: AppImages.onboard1,
      title: 'Connect Effortlessly',
      description:
      'Join meetings, collaborate, and communicate smoothly with Comeeti Online.',
    ),
    _OnboardData(
      image: AppImages.onboard2,
      title: 'Work Smarter',
      description:
      'Simplify your workflow and manage everything in one powerful platform.',
    ),
    _OnboardData(
      image: AppImages.onboard3,
      title: 'Stay Connected',
      description:
      'Collaborate with your team anywhere, anytime — without missing a beat.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            final data = _pages[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  data.image,height: 400,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 40.h),
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),

                  child: Text(
                    data.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.sp,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 60.h),

                // Page indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                        (dotIndex) => AnimatedBuilder(
                      animation: _pageController,
                      builder: (context, _) {
                        double currentPage = 0;
                        try {
                          currentPage = _pageController.page ?? 0;
                        } catch (_) {}
                        final isActive =
                            (dotIndex - currentPage).abs() < 0.5;
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: isActive ? 24.w : 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.blue
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        );
                      },
                    ),
                  ),
                ),
               const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 80.w, vertical: 14.h),
                      ),
                      onPressed: () {
                        if (index == _pages.length - 1) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => SigninView(),
                            ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        index == _pages.length - 1 ? 'Get Started' : 'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            );
          },
        ),
      ),
    );
  }
}

class _OnboardData {
  final String image;
  final String title;
  final String description;

  _OnboardData({
    required this.image,
    required this.title,
    required this.description,
  });
}
