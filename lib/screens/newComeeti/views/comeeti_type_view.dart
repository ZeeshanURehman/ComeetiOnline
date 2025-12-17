import 'package:comeeti_online/screens/newComeeti/views/new_comeeti_view.dart';
import 'package:comeeti_online/screens/newComeeti/views/select_comeeti_view.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/app_texts.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../provider/new_commeti_provider.dart';

class ComeetiTypeView extends StatefulWidget {
  const ComeetiTypeView({super.key});

  @override
  State<ComeetiTypeView> createState() => _ComeetiTypeViewState();
}

class _ComeetiTypeViewState extends State<ComeetiTypeView> {
  final List<String> comeetiTypes = ["15 Days", "30 Days"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // 🔹 Top Green Curve
          Positioned(
            top: 0,
            child: Container(
              height: 230.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(24.sp),
                  bottomLeft: Radius.circular(24.sp),
                ),
              ),
            ),
          ),

          // 🔹 Bottom Green Curve
          Positioned(
            bottom: 0,
            child: Container(
              height: 230.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.sp),
                  topLeft: Radius.circular(24.sp),
                ),
              ),
            ),
          ),

          // 🔹 Title
          Positioned(
            top: 100.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text26(
                text: 'Choose Your Comeeti Type',
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          // 🔹 Main White Card
          Consumer<NewComeetiProvider>(
            builder: (context, provider, _) {
              return Positioned(
                top: 170.h,
                bottom: 170.h,
                left: 30.w,
                right: 30.w,
                child: Container(
                  height: 436.h,
                  width: 370.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(36.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text22(
                        text: 'Select Comeeti Duration',
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                      30.ht,

                      // 🟢 Options (15 Days / 30 Days)
                      Wrap(
                        spacing: 30.w,
                        runSpacing: 20.h,
                        children: List.generate(comeetiTypes.length, (index) {
                          bool isSelected = provider.selectedIndex == index;
                          return GestureDetector(
                            onTap: () => provider.selectIndex(index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              width: 120.w,
                              height: 120.h,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.blue
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(24.r),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.blue
                                      : AppColors.grey,
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  if (isSelected)
                                    BoxShadow(
                                      color:
                                      AppColors.blue.withOpacity(0.4),
                                      blurRadius: 12,
                                      offset: const Offset(0, 5),
                                    )
                                ],
                              ),
                              child: Center(
                                child: Text22(
                                  text: comeetiTypes[index],
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),

                      70.ht,

                      // Continue Button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: CustomButton(
                          text: 'Continue',
                          onTap: () => Get.to(() => const NewComeetiView()),
                          backgroundColor: provider.isButtonEnabled
                              ? AppColors.blue
                              : AppColors.blue.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Center(child: Text24(text: 'Confirmation')),
          content: Text16(
            text: 'Are you sure you want to continue?',
            fontWeight: FontWeight.w400,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: 'Edit',
                  onTap: () => Get.back(),
                  height: 40.h,
                  width: 110.w,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                CustomButton(
                  text: 'Yes',
                  onTap: () => Get.to(() => const SelectComeetiView()),
                  height: 40.h,
                  width: 110.w,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
