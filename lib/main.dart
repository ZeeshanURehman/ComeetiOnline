import 'package:comeeti_online/screens/dashboard/provider/dashboard_provider.dart';
import 'package:comeeti_online/screens/dashboard/views/dashboard_view.dart';
import 'package:comeeti_online/screens/newComeeti/provider/new_commeti_provider.dart';
import 'package:comeeti_online/screens/resetPassword/provider/reset_password_provider.dart';
import 'package:comeeti_online/screens/signin/signin_provider.dart';
import 'package:comeeti_online/screens/signin/signin_view.dart';
import 'package:comeeti_online/screens/signup/signup_provider.dart';
import 'package:comeeti_online/screens/signup/signup_view.dart';
import 'package:comeeti_online/screens/splash_screen.dart';
import 'package:comeeti_online/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
   
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(create: (_) => ResetPasswordProvider()),
        ChangeNotifierProvider(create: (_) => NewComeetiProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(430,932),
          minTextAdapt: true,
          splitScreenMode: true,
        builder: (_,child) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ComeetiOnline',
            home: SplashView(),
          );
        }
      ),
    );
  }
}
