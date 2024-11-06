import 'package:comeeti_online/screens/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
    );
  }
}
