import 'package:comeeti_online/main.dart';
import 'package:comeeti_online/screens/dashboard/slider_component.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/app_texts.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      description: 'Start a new Comeeti and invite others to participate.',
      icon: Icons.group_add,
    ),
    _ListItem(
      title: 'View My Comeeti',
      description: 'See a list of all Comeeti you are part of.',
      icon: Icons.people,
    ),
    _ListItem(
      title: 'Calculate Comeeti',
      description: 'Keep track of contributions and manage pooled funds.',
      icon: Icons.account_balance_wallet,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: Padding(
          padding:  EdgeInsets.all(12.sp),
          child: Container(
            height: 30.h, width: 30.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r),color: AppColors.white,),
            child: Icon(Icons.person,),
          ),
        ),
        title: Text22(text: 'Comeeti Online',color: AppColors.white,fontWeight: FontWeight.w400,),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 16.w),
            child: Icon(Icons.notifications_none,color: AppColors.white,size: 24.sp,),
          ),
        ],

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            80.ht,
            Container(
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
            40.ht,
            Container(
              height: 106.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _items.length,
                separatorBuilder: (context, index) => 20.wd,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Container(
                    width: 106,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(item.icon, color: AppColors.green, size: 30.sp),
                        16.ht,
                    Text14(text: item.title,textAlign: TextAlign.center,),



                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model class for list items
class _ListItem {
  final String title;
  final String description;
  final IconData icon;

  _ListItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}
