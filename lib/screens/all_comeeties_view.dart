import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_appbar.dart';
import 'package:comeeti_online/widgets/custom_progress_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllComeetiesView extends StatelessWidget {
  const AllComeetiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightback,
      appBar: const CustomAppBar(title: 'All Comeeties'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            16.ht,
            _buildHeaderSummary(),
            20.ht,
            _buildSearchAndFilter(),
            20.ht,
            _committeeCard(
              context,
              title: "15-Day Committee - ₹ 500 Group",
              joined: 6,
              total: 12,
              amountPerRound: 500,
              date: "Nov 15, 2025",
              isActive: true,
            ),
            _committeeCard(
              context,
              title: "Monthly Committee",
              joined: 0,
              total: 0,
              amountPerRound: 500,
              spotsLeft: 4,
              isActive: false,
            ),
            _committeeCard(
              context,
              title: "Lucky Draw Committee – Rs. 1,000",
              joined: 12,
              total: 12,
              amountPerRound: 1000,
              date: "Nov 27, 2025",
              isActive: true,
            ),
          ],
        ),
      ),
    );
  }

  // 🌟 Header showing summary stats
  Widget _buildHeaderSummary() {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: AppColors.blueGradient,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem(Icons.people_alt, "Active", "2"),
          _statItem(Icons.currency_exchange, "Total Earned", "Rs.12,400"),
          _statItem(Icons.check_circle_outline, "Joined", "2"),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24.sp),
        4.ht,
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }

  // 🔍 Search bar + Filter dropdown
  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Comeeti...",
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 10.h),
              ),
            ),
          ),
        ),
        10.wd,
        Container(
          height: 45.h,
          width: 45.h,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.filter_list, color: Colors.white, size: 22.sp),
        ),
      ],
    );
  }

  // 🟢 Enhanced committee card
  Widget _committeeCard(
      BuildContext context, {
        required String title,
        required int joined,
        required int total,
        required int amountPerRound,
        String? date,
        int? spotsLeft,
        bool isActive = false,
      }) {
    final progress = total == 0 ? 0.0 : joined / total;
    final bool hasJoined = joined > 0;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Animated CustomProgressCircle
              CustomProgressCircle(
                progress: progress,
                color: isActive ? const Color(0xFF0C3C78) : Colors.grey.shade400,
                backgroundColor: Colors.grey.shade200,
                size: 100,
                strokeWidth: 8,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$joined/$total",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      total == 0 ? "per round" : "Joined",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              14.wd,
              // 📝 Details Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color(0xFFD8F2DE)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            isActive ? "Active" : "Inactive",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: isActive
                                  ? Colors.green.shade700
                                  : Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    4.ht,
                    Text(
                      "Rs. $amountPerRound per round",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black87,
                      ),
                    ),
                    if (spotsLeft != null)
                      Text(
                        "$spotsLeft spots left",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.redAccent.shade200,
                        ),
                      ),
                    if (date != null)
                      Text(
                        "Next draw: $date",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black54,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          14.ht,
          Row(
            children: [
              _outlinedButton("View Details"),
              8.wd,
              if (isActive) _outlinedButton("Make Payment") else const SizedBox(),
              8.wd,
              hasJoined
                  ? _joinedButton("Joined")
                  : _filledButton("Join Now"),
            ],
          )
        ],
      ),
    );
  }

  // 🔲 Outlined button
  Widget _outlinedButton(String text) {
    return Expanded(
      child: Container(
        height: 38.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blue, width: 1.2),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.blue,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }

  // 🟦 Filled primary button
  Widget _filledButton(String text) {
    return Expanded(
      child: Container(
        height: 38.h,
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.blue.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }

  // 🩶 Disabled joined button
  Widget _joinedButton(String text) {
    return Expanded(
      child: Container(
        height: 38.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 16.sp),
              5.wd,
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
