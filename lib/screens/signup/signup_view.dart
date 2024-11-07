import 'package:comeeti_online/screens/signup/complete_signup_view.dart';
import 'package:comeeti_online/screens/signup/signup_provider.dart';
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
      backgroundColor: AppColors.background,
      body: Consumer<SignupProvider>(
          builder: (context, provider, child) {
          return SingleChildScrollView(
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
                        child: Text26(text: 'Comeeti Online',color: AppColors.white,),
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
                                  keyboardType: TextInputType.name,),
                                24.ht,
                                Text16(text: 'Email'),
                                12.ht,
                                CustomTextFormField(hintText: 'Enter your Email',
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,),
                                24.ht,
                                Text16(text: 'Password'),
                                12.ht,
                                CustomTextFormField(
                                  hintText: 'Enter your Password',
                                  controller: passwordController,
                                  obscureText: !provider.isPasswordVisible,
                                  keyboardType: TextInputType.visiblePassword,
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
                                  keyboardType: TextInputType.number,),
                                24.ht,
                                CustomButton(
                                  text: 'Continue',
                                  onTap: () {
                                    Get.to(CompleteSignupView());
                                  },
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
