import 'package:comeeti_online/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_texts.dart';
import '../../utils/extensions.dart';
import '../../widgets/custom_button.dart';

class ComeetiDetailsView extends StatelessWidget {
  const ComeetiDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightback,
      appBar: const CustomAppBar(title: '15-Day Comeeti'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Top Summary Section ---
          Container(
            decoration: BoxDecoration(
             color: AppColors.blue,
              borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(22.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              children: [
                // Title Row with Icon
                Row(
                  children: [
                    Icon(Icons.trending_up, color: Colors.white, size: 26.sp),
                    10.wd,
                    Text(
                      '15-Day Comeeti Overview',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                16.ht,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _amountBox('Rs.200', 'Invested Amount')),
                    20.wd,
                    Expanded(child: _amountBox('Rs.2,400', 'Total Return')),
                  ],
                ),
                20.ht,
                // Progress Bar with label
                LinearProgressIndicator(
                  value: 0.75,
                  color: Colors.greenAccent,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(20),
                ),
                6.ht,
                Text(
                  '75% cycle completed',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 12.sp,
                  ),
                ),
                10.ht,
              ],
            ),
          ),

          16.ht,
          // --- Dates and Members Info ---
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _infoBox(Icons.calendar_today, 'Start Date', 'Apr 10, 2024')),
                    10.wd,
                    Expanded(child: _infoBox(Icons.event, 'End Date', 'Apr 30, 2024')),
                  ],
                ),
                12.ht,
                Row(
                  children: [
                    Expanded(child: _infoBox(Icons.group, 'Total Members', '12')),
                    10.wd,
                    Expanded(child: _infoBox(Icons.payment, 'Pending Payments', '2')),
                  ],
                ),
              ],
            ),
          ),

          16.ht,
          // --- Transactions Header ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.receipt_long, color: AppColors.blue, size: 22.sp),
                8.wd,
                Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
          12.ht,

          // --- Transactions List ---
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                scrollbarTheme: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(AppColors.blue),
                ),
              ),
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 8,
                radius: Radius.circular(10.r),
                interactive: true,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 12,
                  padding: EdgeInsets.only(right: 4.w),
                  itemBuilder: (context, index) {
                    String status;
                    Color statusColor;
                    IconData statusIcon;

                    if (index < 4) {
                      status = "Paid";
                      statusColor = Colors.green;
                      statusIcon = Icons.check_circle;
                    } else if (index == 4) {
                      status = "Pending";
                      statusColor = Colors.orange;
                      statusIcon = Icons.schedule;
                    } else {
                      status = "Upcoming";
                      statusColor = Colors.grey;
                      statusIcon = Icons.access_time;
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        padding: EdgeInsets.all(14.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left Side Info
                            Row(
                              children: [
                                Icon(
                                  statusIcon,
                                  color: statusColor,
                                  size: 22.sp,
                                ),
                                10.wd,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text14(
                                      text: 'Payment #${index + 1}',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                    Text12(
                                      text: 'Apr ${10 + (index * 2)}, 2024',
                                      color: AppColors.black.withOpacity(0.6),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Right Side
                            Row(
                              children: [
                                Text14(
                                  text: 'Rs.200',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blue,
                                ),
                                10.wd,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: statusColor.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(color: statusColor, width: 1),
                                  ),
                                  child: Text(
                                    status,
                                    style: TextStyle(
                                      color: statusColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // --- Bottom Buttons ---
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              text: 'Pay Now',
              onTap: () {},
              width: double.infinity,
              height: 48.h,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              backgroundColor: AppColors.blue,
              textColor: Colors.white,
            ),
            12.ht,
            CustomButton(
              text: 'Generate PDF',
              onTap: () {},
              innerColor: AppColors.white,
              width: double.infinity,
              height: 48.h,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.transparent,
              textColor: AppColors.blue,
              borderColor: AppColors.blue,
            ),
            16.ht,
          ],
        ),
      ),
    );
  }

  // --- Enhanced Reusable Widgets ---
  Widget _amountBox(String value, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          4.ht,
          Text(
            label,
            style: TextStyle(
              color: AppColors.black.withOpacity(0.7),
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoBox(IconData icon, String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(icon, color: AppColors.blue, size: 22.sp),
                  10.wd,
                  Text14(
                    text: title,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black.withOpacity(0.7),
                  ),
                ],
              ),
              4.ht,
              Text16(
                text: value,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
