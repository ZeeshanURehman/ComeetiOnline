import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_colors.dart';
import '../provider/dashboard_provider.dart';

class SliderComponent extends StatelessWidget {
  const SliderComponent({super.key});

  final List<String> _data = const [
    "Welcome to the Comeeti Community",
    "Join a Comeeti",
    "Track Your Transactions"
  ];

  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(context);

    return Column(
      children: [
        SizedBox(
          height: 230.h,
          child: PageView.builder(
            itemCount: _data.length,
            onPageChanged: sliderProvider.updateIndex,
            itemBuilder: (context, index) => _buildCarouselItem(index),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _data.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              width: sliderProvider.currentIndex == index ? 20.w : 8.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: sliderProvider.currentIndex == index
                    ? AppColors.blue
                    : AppColors.grey,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(int index) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey.withOpacity(0.93)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Container(
            height: 202.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.blue,
            ),
          ),
          Center(
            child: Text(
              _data[index],
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
