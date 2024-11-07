import 'package:comeeti_online/screens/resetPassword/provider/reset_password_provider.dart';
import 'package:comeeti_online/screens/signin/signin_provider.dart';
import 'package:comeeti_online/screens/signin/signin_view.dart';
import 'package:comeeti_online/screens/signup/signup_provider.dart';
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
      ],
      child: ScreenUtilInit(
          designSize: const Size(430,932),
          minTextAdapt: true,
          splitScreenMode: true,
        builder: (_,child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ComeetiOnline',
          home: SigninView()
          );
        }
      ),
    );
  }
}
