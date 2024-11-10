import 'package:comeeti_online/screens/dashboard/dashboard_view.dart';
import 'package:comeeti_online/screens/resetPassword/views/forget_password_view.dart';
import 'package:comeeti_online/screens/resetPassword/views/reset_password_view.dart';
import 'package:comeeti_online/screens/signin/signin_provider.dart';
import 'package:comeeti_online/screens/signup/signup_view.dart';
import 'package:comeeti_online/utils/app_colors.dart';
import 'package:comeeti_online/utils/app_texts.dart';
import 'package:comeeti_online/utils/extensions.dart';
import 'package:comeeti_online/widgets/custom_bottom_bar.dart';
import 'package:comeeti_online/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_button.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body:   Consumer<SignInProvider>(
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
                      top: 170.h,
                      bottom: 150.h,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child:  Text26(text: 'Sign in',),),
                             20.ht,
                              Text16(text: 'Email'),
                              12.ht,
                              CustomTextFormField(hintText: 'Enter your Email',
                                controller: emailController,
                                prefixIcon: Icon(Icons.email,color: AppColors.grey,size: 24.sp,),
                                keyboardType: TextInputType.emailAddress,),
                              24.ht,
                              Text16(text: 'Password'),
                              12.ht,
                              CustomTextFormField(
                                hintText: 'Enter your Password',
                                controller: passwordController,
                                prefixIcon: Icon(Icons.lock,color: AppColors.grey,size: 24.sp,),
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
                              12.ht,
                              GestureDetector(
                                onTap: (){Get.to(ForgetPasswordView());},
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text12(text: 'Forgot Password?',color: AppColors.green,),
                                ),
                              ),
                              24.ht,
                              CustomButton(
                                text: 'Sign in',
                                onTap: () {
                                  Get.to(CustomBottomNavBar());
                                },
                              ),
                              20.ht,
                              GestureDetector(
                                onTap: () {
                                  Get.to(SignupView());
                                },
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text14(text: 'Don’t have an account? ',color: AppColors.grey,),
                                    Text14(text: 'Sign up ',color: AppColors.green,),
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
          );
        }
      ),
    );
  }
}
