import 'package:comeeti_online/utils/app_texts.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_dropdown.dart';
import 'calculation_controller.dart';

class CalculateComeetiView extends StatelessWidget {
  const CalculateComeetiView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalculateComeetiController());

    return Scaffold(
      backgroundColor: AppColors.lightback,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Transform.translate(
                offset: const Offset(0, -50),
                child: Column(
                  children: [
                    _buildFormCard(controller),
                    16.ht,
                    Obx(() {
                      if (controller.totalPool.value == "0") return const SizedBox.shrink();
                      return _buildResultsCard(controller);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => Container(
    height: 180.h,
    color: AppColors.blue,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios_new_sharp,
                  color: AppColors.white, size: 20.sp),
              const Spacer(),
              Text18(text: 'Calculate Comeeti', color: AppColors.white),
              const Spacer(),
            ],
          ),
          16.ht,
          Text15(
            text: 'Estimate your profit and payment cycle before joining.',
            color: AppColors.white,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );

  Widget _buildFormCard(CalculateComeetiController controller) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.r),
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => CustomDropdownField<String>(
          label: 'Comeeti Type',
          hint: "Select Comeeti Type",
          value: controller.committeeType.value.isEmpty
              ? null
              : controller.committeeType.value,
          items: const ["Lucky", "Monthly", "15-Day"],
          itemLabel: (s) => s,
          onChanged: (v) => controller.committeeType.value = v!,
        )),
        14.ht,
        Obx(() => CustomDropdownField<String>(
          label: 'Investment Amount (Rs)',
          hint: "Select Amount",
          value: controller.investmentAmount.value.isEmpty
              ? null
              : controller.investmentAmount.value,
          items: const ["200", "500", "1000", "2000", "3000", "5000"],
          itemLabel: (s) => "Rs. $s",
          onChanged: (v) => controller.investmentAmount.value = v!,
        )),
        14.ht,
        Obx(() => CustomDropdownField<String>(
          label: 'Total Members',
          hint: "Select Members",
          value: controller.totalMembers.value.isEmpty
              ? null
              : controller.totalMembers.value,
          items: const ["6", "12"],
          itemLabel: (s) => "$s Members",
          onChanged: (v) => controller.totalMembers.value = v!,
        )),
        16.ht,
        CustomButton1(
          text: 'Calculate',
          onTap: controller.calculateComeeti,
          color: AppColors.blue,
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
  );

  Widget _buildResultsCard(CalculateComeetiController controller) => Column(
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text18(
              text: 'Comeeti Summary',
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            const Divider(thickness: 1),
            _resultRow('Comeeti Type', controller.committeeType.value),
            _resultRow(
                'Amount Per Member (Rs)', controller.investmentAmount.value),
            _resultRow('Total Members', controller.totalMembers.value),
            _resultRow('Total Pool (Rs)', controller.totalPool.value),
            _resultRow('Duration', controller.duration.value),
            const Divider(thickness: 1),
            _resultRow(
              'Expected Return (Rs)',
              "${controller.expectedReturn.value} (${controller.profitPercentage.value}%)",
              valueColor: AppColors.green,
            ),
            4.ht,
            Text14(
              text:
              'Profit depends on payout sequence and type of comeeti',
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
            )
          ],
        )),
      ),
      16.ht,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomButton1(
              text: 'Recalculate',
              onTap: controller.reset,
              color: Colors.orange.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          10.wd,
          Expanded(
            child: CustomButton1(
              text: 'Save Estimate',
              onTap: controller.saveEstimate,
              color: AppColors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          10.wd,
          Expanded(
            child: CustomButton1(
              text: 'Join Comeeti',
              onTap: controller.joinComeeti,
              color: AppColors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ],
  );

  Widget _resultRow(String title, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text16(
            text: title,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          Text16(
            text: value,
            fontWeight: FontWeight.w400,
            color: valueColor ?? AppColors.blue,
          ),
        ],
      ),
    );
  }
}
