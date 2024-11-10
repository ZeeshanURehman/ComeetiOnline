import 'package:comeeti_online/screens/select_comeeti_view.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/app_texts.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewComeetiView extends StatefulWidget {
  const NewComeetiView({super.key});

  @override
  State<NewComeetiView> createState() => _NewComeetiViewState();
}

class _NewComeetiViewState extends State<NewComeetiView> {

  int _selectedIndex = 10;
  final List<String> amount = ['1000', '5,000', '10,000', '15,000', '20,000','25,000','30,000','50,000'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    // top green container
                    Positioned( top: 0,
                      child: Container(
                        height: 230.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                    ),
                    //bottom green container
                    Positioned( bottom: 0,
                      child: Container(
                        height: 230.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Select Comeeti
              Positioned(
                top: 100.h,
                left: 0.w,
                right: 0.w,
                child: Center(
                  child: Text26(text: 'Select Comeeti',color: AppColors.white,),
                ),
              ),
              // white container
              Positioned(
                top: 170.h,
                bottom: 170.h,
                left: 30.w,
                right: 30.w,
                child: Container(
                  height: 436.h,
                  width: 370.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(36.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text26(text: 'Select Price of Comeeti'),
                      30.ht,
                      Wrap(
                        spacing: 18,runSpacing: 6,
                        children: List.generate(amount.length, (index) {
                          bool isSelected = _selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index; // Update the selected index
                              });
                            },
                            child: Chip(
                              backgroundColor: isSelected ? AppColors.green : AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(isSelected ? 22.r : 22.r),
                                side: BorderSide(color: isSelected ? AppColors.green : AppColors.grey),
                              ),
                              label: Text(
                                amount[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: isSelected ? AppColors.white : AppColors.green,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      70.ht,
                      Padding(
                        padding: EdgeInsets.only(left: 40.w, right: 40.w),
                        child: CustomButton(text: 'Continue', onTap: (){_showConfirmationDialog(context);}),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Center(child: Text24(text: 'Confirmation',)),
          content: Text16(text: 'Are you sure you want to continue?',fontWeight: FontWeight.w400,),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(text: 'Edit', onTap: (){Get.back();},height: 40.h,width: 110.w,fontSize: 18.sp,fontWeight: FontWeight.w500,borderRadius:BorderRadius.circular(6.r)),
                CustomButton(text: 'Yes', onTap: (){Get.to(SelectComeetiView());},height: 40.h,width: 110.w,fontSize: 18.sp,fontWeight: FontWeight.w500,borderRadius:BorderRadius.circular(6.r)),
              ],
            ),
             ],
        );
      },
    );
  }

}
