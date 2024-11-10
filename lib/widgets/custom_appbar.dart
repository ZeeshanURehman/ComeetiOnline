import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.green,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: leading ??
          GestureDetector(
            onTap: () => Get.toNamed('/myProfile'), // Example route navigation
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: AppColors.white,
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.green,
                ),
              ),
            ),
          ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat',
        ),
      ),
      actions: actions ??
          [
            Icon(
              Icons.search,
              color: AppColors.white,
              size: 24.sp,
            ),
            SizedBox(width: 10.w),
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                onTap: () => Get.toNamed('/notifications'), // Example route navigation
                child: Icon(
                  Icons.notifications_none,
                  color: AppColors.white,
                  size: 24.sp,
                ),
              ),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
