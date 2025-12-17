import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/app_images.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightback,
      appBar: const CustomAppBar(title: "My Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.ht,
            _buildHeader(context),
            16.ht,
            _buildStatsCard(),
            16.ht,
            _buildMenuList(context),
            16.ht,
            _logoutButton(),
            20.ht,
          ],
        ),
      ),
    );
  }

  // 🧑‍💼 User Header Section
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Picture
          CircleAvatar(
            radius: 45.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 42.r,
              backgroundColor: AppColors.blue,
              child: const Icon(Icons.person,color: AppColors.white,size: 60,),
            ),
          ),
          10.ht,
          Text(
            "Zeeshan Ur Rehman",
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
          ),
          Text(
            "zeeshanrehman840@gmail.com",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }

  // 📊 Stats Card
  Widget _buildStatsCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem(Icons.people_alt_outlined, "Active", "4"),
          _divider(),
          _statItem(Icons.currency_rupee, "Invested", "₹12,400"),
          _divider(),
          _statItem(Icons.trending_up, "Profit", "₹2,800"),
        ],
      ),
    );
  }

  Widget _divider() => Container(
    height: 40.h,
    width: 1,
    color: Colors.grey.shade300,
  );

  Widget _statItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: AppColors.blue, size: 24.sp),
        6.ht,
        Text(
          value,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }

  // ⚙️ Menu Items
  Widget _buildMenuList(BuildContext context) {
    final menuItems = [
      {
        "icon": Icons.edit,
        "title": "Edit Profile",
        "color": Colors.blueAccent,
      },
      {
        "icon": Icons.account_balance_wallet_outlined,
        "title": "My Wallet",
        "color": Colors.green,
      },
      {
        "icon": Icons.notifications_none_rounded,
        "title": "Notifications",
        "color": Colors.orange,
      },
      {
        "icon": Icons.help_outline,
        "title": "Help & Support",
        "color": Colors.purple,
      },
      {
        "icon": Icons.info_outline,
        "title": "About App",
        "color": Colors.teal,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          ...menuItems.map(
                (item) => Container(
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Container(
                  height: 40.h,
                  width: 40.h,
                  decoration: BoxDecoration(
                    color: (item['color'] as Color).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(item['icon'] as IconData,
                      color: item['color'] as Color),
                ),
                title: Text(
                  item['title'] as String,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.grey.shade400, size: 16.sp),
                onTap: () {
                  // Implement navigation here
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔴 Logout Button
  Widget _logoutButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: GestureDetector(
        onTap: () {
          // Handle logout logic here
        },
        child: Container(
          height: 48.h,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0C3C78), Color(0xFF1C68A1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, color: Colors.white, size: 20.sp),
              8.wd,
              Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
