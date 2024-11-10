import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_texts.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back,color: AppColors.white,)),
        title: Text22(text: 'My Profile',color: AppColors.white,fontWeight: FontWeight.w400,),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 16.w),
            child: Icon(Icons.notifications_none,color: AppColors.white,size: 24.sp,),
          ),
        ],
      ),
    );
  }
}
