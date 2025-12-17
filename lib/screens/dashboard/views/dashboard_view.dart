import 'package:comeeti_online/screens/acticeComeeties/active_comeeti_view.dart';
import 'package:comeeti_online/screens/calculate_comeeti_view.dart';
import 'package:comeeti_online/screens/newComeeti/views/comeeti_type_view.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/app_texts.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_button.dart';
import 'package:comeeti_online/widgets/custom_progress_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_appbar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  final List<_ListMajors> _majors = [
    _ListMajors(
      title: 'Total Investments',
      icon: Icons.trending_up, // Represents growth/investment
      amount: '25,000',
      onTap: () {},
    ),
    _ListMajors(
      title: 'Total Profit/ Return',
      icon: Icons.account_balance_wallet_outlined, // Wallet/profit look
      amount: '25,00',
      onTap: () {},
    ),
    _ListMajors(
      title: 'Pending Payments',
      icon: Icons.error_outline, // Indicates something pending/time-related
      amount: '2',
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightback,
      appBar: const CustomAppBar(
        title: 'Comeeti Online',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.ht,
              _buildWalletProgressCard(),
              16.ht,
              Row(
                children: [
                  Expanded(
                    child: CommetiActionCard(
                      icon: Icons.add,
                      title: 'Create New Commeti',
                      onTap: () {
                        Get.to(const ComeetiTypeView());
                      },
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: CommetiActionCard(
                      icon: Icons.calculate_outlined,
                      title: 'Calculate Commeti',
                      onTap: () {
                        Get.to(const CalculateComeetiView());
                      },
                    ),
                  ),
                ],
              ),
              16.ht,
              _buildActiveComeetiCard(),
              16.ht,
              Text18(text: 'Active Commeties',fontWeight: FontWeight.w600,),
              7.ht,
              Padding(
                padding:  EdgeInsets.only(bottom: 20.h),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    separatorBuilder: (context, index) => 10.ht,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.to(const ComeetiDetailsView()),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text16(text: '15-Days'),
                                  Text14(
                                    text: 'Rs.200',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text14(
                                    text: 'Apr 10,2024',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Text14(
                                    text: '12 members',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              20.wd,
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Text12(
                                    text: 'Active',
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  )),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              20.ht,
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildWalletProgressCard() {
  return Container(
    padding: EdgeInsets.all(16.sp),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(14.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text22(
              text: 'Comeeti Online',
              color: AppColors.blue,
              fontWeight: FontWeight.w600,
            ),
            Row(
              children: [
                Icon(
                  Icons.card_giftcard,
                  size: 20.sp,
                ),
                6.wd,
                Text14(text: 'My Reward  '),
              ],
            ),
          ],
        ),
        10.ht,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet_outlined,
                color: AppColors.blue, size: 22.sp),
            6.wd,
            Text(
              "Wallet Balance",
              style: TextStyle(
                  color: AppColors.black.withOpacity(0.7),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            CustomButton(
              text: 'Add Cash',
              onTap: () {},
              width: 100.w,
              height: 30.h,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        10.ht,
        Text(
          "₹12,450",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        10.ht,
        LinearProgressIndicator(
          value: 0.75,
          backgroundColor: AppColors.lightback,
          color: AppColors.blue,
          minHeight: 6,
          borderRadius: BorderRadius.circular(10.r),
        ),
        6.ht,
        Text(
          "75% of monthly goal reached",
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.black.withOpacity(0.6),
          ),
        ),
      ],
    ),
  );
}

class _ListMajors {
  final String title;
  final String amount;
  final IconData icon;
  final VoidCallback onTap;

  _ListMajors({
    required this.title,
    required this.amount,
    required this.icon,
    required this.onTap,
  });
}

class CommetiActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const CommetiActionCard({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.blue,
              radius: 22.r,
              child: Icon(icon, color: AppColors.white,size: 26.sp,),
            ),
            10.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget _buildActiveComeetiCard() {
  final List<Map<String, dynamic>> committees = [
    {
      "name": "15-Day Commeti",
      "joined": 7,
      "total": 12,
      "color": Colors.blue.shade800,
      "label": "5 Spots Left",
    },
    {
      "name": "Monthly Commeti",
      "joined": 10,
      "total": 12,
      "color": Colors.grey,
      "label": "2 Spots Left",
    },
    {
      "name": "Lucky Draw",
      "joined": 5,
      "total": 12,
      "color": Colors.green,
      "label": "7 Spots Left",
    },
  ];

  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.sp),
    decoration: BoxDecoration(
      color: AppColors.blue,
      borderRadius: BorderRadius.circular(18.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Active Commeties",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  "As of October 2025",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            Icon(Icons.people_alt_rounded,
                color: Colors.white.withOpacity(0.9), size: 22.sp),
          ],
        ),

        24.ht,

        // Circular Commeti Progress Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: committees.map((committee) {
            final joined = committee["joined"];
            final total = committee["total"];
            final progress = joined / total;

            return Column(
              children: [
                CustomProgressCircle(
                  progress: progress,
                  color: committee["color"],
                  backgroundColor: Colors.white.withOpacity(0.15),
                  strokeWidth: 6,
                  size: 80,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$joined/$total",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "Joined",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                12.ht,
                Text(
                  committee["name"],
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            );
          }).toList(),
        ),

        24.ht,

        // Footer Message
        Center(
          child: Text(
            "You're 2 members away from completing your next Commeti 🎉",
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}


