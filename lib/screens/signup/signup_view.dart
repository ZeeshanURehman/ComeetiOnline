import 'package:comeeti_online/screens/signin/signin_view.dart';
import 'package:comeeti_online/screens/signup/complete_signup_view.dart';
import 'package:comeeti_online/screens/signup/signup_provider.dart';
import 'package:comeeti_online/utils/app_images.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_texts.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      body: Consumer<SignupProvider>(
          builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          // top container
                          Positioned( top: 0,
                            child: Container(
                              height: 280.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: AppColors.blueGradient,
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(24.sp),bottomLeft: Radius.circular(24.sp)),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    // Comeeti logo
                    Positioned(
                      top: 60.h,
                      left: 0.w,
                      right: 0.w,
                      child: Center(
                        child: Image.asset(AppImages.logo,height: 160.h,width: 160.w,),
                      ),
                    ),
                    // white container
                    Positioned(
                      top: 220.h,
                      bottom: 130.h,
                      left: 30.w,
                      right: 30.w,
                      child: Container(
                        height: 436.h,
                        width: 370.w,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(36.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.ht,
                                Center(child:  Text26(text: 'Sign up',),),
                                16.ht,
                                Text16(text: 'Name'),
                                12.ht,
                                CustomTextFormField(hintText: 'Enter your full name',
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  prefixIcon: Icon(Icons.person,color: AppColors.grey,size: 20.sp,),
                                ),
                                24.ht,
                                Text16(text: 'Email'),
                                12.ht,
                                CustomTextFormField(hintText: 'Enter your Email',
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  prefixIcon: Icon(Icons.email,color: AppColors.grey,size: 18.sp,),),
                                24.ht,
                                Text16(text: 'Password'),
                                12.ht,
                                CustomTextFormField(
                                  hintText: 'Enter your Password',
                                  controller: passwordController,
                                  obscureText: !provider.isPasswordVisible,
                                  keyboardType: TextInputType.visiblePassword,
                                  prefixIcon: Icon(Icons.lock,color: AppColors.grey,size: 18.sp,),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      provider.isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: provider.togglePasswordVisibility,
                                  ),),
                                24.ht,
                                Text16(text: 'Phone Number'),
                                12.ht,
                                CustomTextFormField(hintText: 'Enter your Phone Number',
                                  controller: numberController,
                                  prefixIcon: Icon(Icons.phone,color: AppColors.grey,size: 18.sp,),
                                  keyboardType: TextInputType.number,),
                                24.ht,
                                CustomButton(
                                  text: 'Continue',
                                  onTap: () {
                                    Get.to(CompleteSignupView());
                                  },
                                ),
                                20.ht,
                                GestureDetector(
                                  onTap: () {
                                    Get.to(SigninView());
                                  },
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text14(text: 'Already have an account? ',color: AppColors.grey,),
                                      Text14(text: 'Sign in ',color: AppColors.blue,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
