import 'package:comeeti_online/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_texts.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import 'new_comeeti_controller.dart';

class CreateComeetiView extends StatelessWidget {
  const CreateComeetiView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateComeetiController());

    return Portal(
      child: Scaffold(
        backgroundColor: AppColors.lightback,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildFormCard(controller),
            ],
          ),
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
              Text18(text: 'Create New Comeeti', color: AppColors.white),
              const Spacer(),
            ],
          ),
          16.ht,
          Text15(
            text:
            'Set up your new comeeti by choosing type, members and duration.',
            color: AppColors.white,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );

  Widget _buildFormCard(CreateComeetiController controller) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Transform.translate(
      offset: const Offset(0, -50),
      child: Container(
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
              value: controller.committeeType!.value.isEmpty
                  ? null
                  : controller.committeeType!.value,
              items: controller.committeeTypeOptions,
              itemLabel: (s) => s,
              onChanged: (v) => controller.setCommitteeType(v!),
            )),
            14.ht,
            Obx(() => CustomDropdownField<String>(
              label: 'Comeeti Duration',
              hint: "Select Duration",
              value: controller.duration!.value.isEmpty
                  ? null
                  : controller.duration!.value,
              items: controller.durationOptions,
              itemLabel: (s) => s,
              onChanged: (v) => controller.setDuration(v!),
            )),
            14.ht,
            Obx(() => CustomDropdownField<String>(
              label: 'Amount Per Member (Rs)',
              hint: "Select Amount",
              value: controller.investmentAmount!.value.isEmpty
                  ? null
                  : controller.investmentAmount!.value,
              items: controller.amountOptions,
              itemLabel: (s) => "Rs. $s",
              onChanged: (v) => controller.setInvestmentAmount(v!),
            )),
            14.ht,
            Obx(() => CustomDropdownField<String>(
              label: 'Total Members',
              hint: "Select Members",
              value: controller.totalMembers!.value.isEmpty
                  ? null
                  : controller.totalMembers!.value,
              items: controller.memberOptions,
              itemLabel: (s) => "$s Members",
              onChanged: (v) => controller.setTotalMembers(v!),
            )),
            14.ht,
            Obx(() => CustomDropdownField<String>(
              label: 'Available Comeeti Months',
              hint: "Select Months",
              value: controller.availableMonths!.value.isEmpty
                  ? null
                  : controller.availableMonths!.value,
              items: controller.monthOptions,
              itemLabel: (s) => "$s Months",
              onChanged: (v) => controller.setAvailableMonths(v!),
            )),
            20.ht,
            CustomButton1(
              text: 'Create Comeeti',
              onTap: controller.createComeeti,
              color: AppColors.blue,
            ),
          ],
        ),
      ),
    ),
  );
}
