import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class SliderComponent extends StatefulWidget {
  const SliderComponent({super.key});

  @override
  _SliderComponentState createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  int _currentIndex = 0;

  // Sample data for illustration
  final List<String> _data = ["Welcome to the Comeeti Community", "Join a Comeeti", "Track Your Transactions"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView for sliding containers
        SizedBox(
          height: 230.h,
          child: PageView.builder(
            itemCount: _data.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildCarouselItem(index);
            },
          ),
        ),

        SizedBox(height: 16.h),

        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _data.length,
                (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: _currentIndex == index ? 20.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: _currentIndex == index ? AppColors.green : AppColors.grey,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Reusable function to build each page
  Widget _buildCarouselItem(int index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey.withOpacity(0.93)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 202.h,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: AppColors.green),

              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    _data[index], // Display different text for each item
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
