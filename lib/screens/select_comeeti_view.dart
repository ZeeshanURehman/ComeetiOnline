import 'package:comeeti_online/utils/app_images.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_button.dart';
import 'package:comeeti_online/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_texts.dart';

class SelectComeetiView extends StatefulWidget {
  const SelectComeetiView({super.key});

  @override
  State<SelectComeetiView> createState() => _SelectComeetiViewState();
}

class _SelectComeetiViewState extends State<SelectComeetiView> {
  // Initially selected months (March, April, August, December) that cannot be deselected
  Set<int> _selectedIndices = {2, 3, 7, 11};

  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  final List<TextEditingController> controllers = List.generate(3, (_) => TextEditingController());
  final List<String> images = [
    AppImages.easypaisa,
    AppImages.jazzcash,
    AppImages.visa,
  ];

  @override
  void dispose() {
    // Dispose each controller when the widget is disposed
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            40.ht,
            Text22(text: 'Available Comeeties in Months', fontWeight: FontWeight.w400),
            40.ht,
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20.sp,
                  mainAxisSpacing: 20.sp,
                  childAspectRatio: 2.6,
                ),
                itemCount: months.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedIndices.contains(index);  // Check if the current month is selected

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        // Only allow selection or deselection of months if we haven't reached 5 selections
                        if (_selectedIndices.length < 5) {
                          if (isSelected) {
                            _selectedIndices.remove(index);  // Deselect the selected month
                          } else {
                            _selectedIndices.add(index);  // Select the month
                          }
                        } else {
                          // Don't allow deselection of already selected months
                          if (!isSelected && _selectedIndices.length == 5) {
                            // Select only if there's space
                            _selectedIndices.add(index);
                          }
                        }
                      });
                    },
                    child: Container(
                      height: 40.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.green : AppColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          months[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: isSelected ? AppColors.white : AppColors.green,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomButton(
              text: 'Next',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  ),
                  backgroundColor: AppColors.white,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 20.w),
                            child: Center(child: Text22(text: 'Select Payment Method')),
                          ),
                          Container(
                            height:300.h      ,
                      child: ListView.separated(
                              separatorBuilder: (context, index) => Divider(color: AppColors.grey),
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return ExpansionTile(
                                  shape: Border(
                                    top: BorderSide(color: Colors.transparent),
                                    bottom: BorderSide(color: Colors.transparent),
                                  ),
                                  leading: Image.asset(
                                    images[index],
                                    height: 24.sp,
                                  ),
                                  title: Text(''),
                                  iconColor: AppColors.grey,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 40.h,
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.r),
                                              color: AppColors.background,
                                            ),
                                            child: Center(child: Text18(text: '92')),
                                          ),
                                          10.wd,
                                          Expanded(
                                            child: CustomTextFormField(
                                              keyboardType: TextInputType.number,
                                              hintText: 'xxxxxxxxxx',
                                              controller: controllers[index],
                                              limitTo10Digits: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          20.ht,
                          Padding(
                            padding:  EdgeInsets.all(20.sp),
                            child: CustomButton(
                              text: 'Close',
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
