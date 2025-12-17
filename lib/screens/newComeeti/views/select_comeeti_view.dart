import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_texts.dart';
import '../../../utils/extensions.dart';
import '../../../widgets/custom_button.dart';
import '../new_comeeti_controller.dart';

class SelectComeetiView extends StatelessWidget {
  const SelectComeetiView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectComeetiController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            40.ht,
            Text22(
              text: 'Available Comeeties in Months',
              fontWeight: FontWeight.w400,
            ),
            40.ht,
            Expanded(
              child: Obx(() => GridView.builder(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 18.sp,
                  mainAxisSpacing: 16.sp,
                  childAspectRatio: 2.4,
                ),
                itemCount: controller.months.length,
                itemBuilder: (context, index) {
                  bool isInitiallySelected = controller
                      .initiallySelectedIndices
                      .contains(index);
                  bool isSelected = controller.selectedIndices
                      .contains(index);

                  return GestureDetector(
                    onTap: () => controller.toggleMonthSelection(
                        index, context),
                    child: Container(
                      height: 40.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: isInitiallySelected
                            ? AppColors.blue.withOpacity(0.4)
                            : (isSelected
                            ? AppColors.blue
                            : AppColors.white),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          controller.months[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: isInitiallySelected || isSelected
                                ? AppColors.white
                                : AppColors.blue,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
            ),
            CustomButton(
              text: 'Next',
              onTap: () => controller.showPaymentSheet(context),
            ),
          ],
        ),
      ),
    );
  }
}
