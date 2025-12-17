import 'package:comeeti_online/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class FullScreenDrawer extends StatelessWidget {
  const FullScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Profile & Settings",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Icon(Icons.close,color: AppColors.white,size: 22.sp,),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              // 🔹 Profile Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF0B1E3C), // Dark blue shade
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: EdgeInsets.all(16.w),
                child: Row(
                  children: [
                    // Profile image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child:const Icon(CupertinoIcons.profile_circled,color: AppColors.white,size: 70,),
                    ),
                    SizedBox(width: 16.w),

                    // User Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ZEESHANUR REHMAN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "03105832561",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "zeeshanrehman840@gmail.com",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    // Edit Button
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: const Color(0xFF0B1E3C),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              // 🔹 Menu Items
              _buildMenuItem(
                icon: Icons.arrow_circle_up_outlined,
                title: "Upgrade Account",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.receipt_long_rounded,
                title: "Transaction History",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.emoji_events_outlined,
                title: "Goals & Rewards",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.check_circle_outline,
                title: "My Approvals",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.star_border_rounded,
                title: "My Favourites",
                onTap: () {},
              ),

              SizedBox(height: 40.h),

              // 🔹 Logout
              TextButton(
                onPressed: () {
                  // handle logout
                  Get.back();
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper widget for list items
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      horizontalTitleGap: 20,            //  reduces space between icon and text
      minVerticalPadding: 0,            //  tightens vertical space
      dense: true,                      //  makes tile more compact
      leading: Icon(icon, color: Colors.black, size: 26.sp),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
      onTap: onTap,
    );
  }
}
