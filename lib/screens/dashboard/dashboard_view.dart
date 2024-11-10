import 'package:comeeti_online/screens/calculate_comeeti_view.dart';
import 'package:comeeti_online/screens/my_comeeti_view.dart';
import 'package:comeeti_online/screens/new_comeeti_view.dart';
import 'package:comeeti_online/screens/notifications_view.dart';
import 'package:comeeti_online/screens/profile/my_profile_view.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/app_texts.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_appbar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  // Updated list items data to fit "Comeeti" app context
  final List<_ListItem> _items = [
    _ListItem(
      title: 'Create New Comeeti',
      icon: Icons.group_add,
      onTap: () {Get.to(NewComeetiView());},
    ),
    _ListItem(
      title: 'View My Comeeti',
      icon: Icons.people,
      onTap: () {Get.to(MyComeetiView());},
    ),
    _ListItem(
      title: 'Calculate Comeeti',
      icon: Icons.account_balance_wallet,
      onTap: () {Get.to(CalculateComeetiView());},
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Comeeti Online',
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.black.withOpacity(0.02,),width: 4)),
              color: AppColors.green,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Shadow color
                  offset: Offset(0, -4), // Offset to the top
                  blurRadius: 8, // Blur radius
                  spreadRadius: 4, // Spread the shadow a bit
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text22(text: 'Comeeti Online',color: AppColors.green,fontWeight: FontWeight.w400,),
                        12.ht,
                        Text12(text: 'Available balance',color: AppColors.black.withOpacity(0.6),fontWeight: FontWeight.w400,),
                        8.ht,
                        Text12(text: 'Tap to show balance',color: AppColors.black.withOpacity(0.6),fontWeight: FontWeight.w400,),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.card_giftcard,size: 16.sp,),6.wd,
                            Text12(text: 'My Reward  '),
                          ],
                        ),
                        16.ht,
                        CustomButton(text: 'Upgrade Account', onTap: (){},width: 124.w,height: 28.h,fontSize: 12.sp,fontWeight: FontWeight.w400,backgroundColor: AppColors.green,textColor: AppColors.black,innerColor: AppColors.white,borderColor: AppColors.green,),
                        6.ht,
                        CustomButton(text: 'Add Cash', onTap: (){},width: 124.w,height: 28.h,fontSize: 12.sp,fontWeight: FontWeight.w400,),
                ]
                    ),
                  ],
                ),
              ),
            ),
          ),
          40.ht,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            height: 106.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _items.length,
              separatorBuilder: (context, index) => SizedBox(width: 20.w),
              itemBuilder: (context, index) {
                final item = _items[index];
                return GestureDetector(
                  onTap: item.onTap, // Call the navigation action
                  child: Container(
                    width: 105,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color with opacity
                          offset: Offset(0, 4), // Shadow positioned 4 pixels downward
                          blurRadius: 8, // Shadow blur
                          spreadRadius: 2, // Spread the shadow slightly
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(item.icon, color: AppColors.green, size: 30.sp),
                        SizedBox(height: 16.h),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        ],
      ),

    );
  }
}

// Model class for list items
class _ListItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  _ListItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
