import 'package:comeeti_online/screens/signup_view.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 1000.h,
                  child: Stack(
                    children: [
                      // top green container
                      Positioned( top: 0,
                        child: Container(
                          height: 260.h,
                          width: 430.w,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                      //bottom green container
                      Positioned( bottom: 0,
                        child: Container(
                          height: 260.h,
                          width: 430.w,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Comeeti logo
                Positioned(
                  top: 100.h,
                  left: 0.w,
                  right: 0.w,
                  child: Center(
                    child: Text('Comeeti Online',style: TextStyle(fontSize: 26.sp,color: Colors.white),),
                  ),
                ),
                // white container
                Positioned(
                  top: 200.h,
                  bottom: 200.h,
                  left: 30.w,
                  right: 30.w,
                  child: Container(
                    height: 436.h,
                    width: 370.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text('Sign in',style: TextStyle(fontSize: 26.sp,color: Colors.black,fontWeight: FontWeight.w500),)),
                          SizedBox(height: 30.h),
                          Text('Email',style: TextStyle(fontSize: 18.sp,color: Colors.black),),
                          SizedBox(height: 16.h),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color:Colors.grey,
                              ),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.1),
                              contentPadding:
                              EdgeInsets.only(top: 10.h, left: 12.w),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.r),
                              ),

                              errorStyle: TextStyle(fontSize: 12.sp),
                            ),

                          ),
                          SizedBox(height: 30.h),
                          Text('Password',style: TextStyle(fontSize: 18.sp,color: Colors.black),),
                          SizedBox(height: 16.h),
                          TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                fontFamily: "Quicksand",
                                color:Colors.grey,
                              ),
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.1),
                              contentPadding:
                              EdgeInsets.only(top: 10.h, left: 12.w),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              suffixIcon: Icon(CupertinoIcons.eye_fill,size: 20,color: Colors.grey,)


                            ),

                          ),
                          SizedBox(height: 30.h),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text('Forgot Password?',style: TextStyle(color: AppColors.green,fontSize: 12),)),
                          SizedBox(height: 30.h),
                          GestureDetector(
                            onTap: (){Get.to(SignupView());},
                            child: Container(
                              height: 50, width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.green,borderRadius: BorderRadius.circular(28)),
                              child: Center(child: Text('Sign in ',style: TextStyle(color: Colors.white,fontSize: 18),)),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          GestureDetector(
                            onTap: () {
                              Get.to(SignupView());
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don’t have an account? ',style: TextStyle(color: Colors.grey,fontSize: 16),),
                                Text('Sign up',style: TextStyle(color: AppColors.green,fontSize: 16),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
