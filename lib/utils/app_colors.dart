import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color blue = Color(0xff0E1A35);
  static const Color background = Color(0xFFF5F5F5);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightback = Color(0xFFEAF2FF);
  static const Color green = Colors.green;


  //  Green Gradient
  static const LinearGradient greenGradient = LinearGradient(
    colors: [
      Color(0xFFFF5E62), // Bright Coral Red
      Color(0xFFFD3A69),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [
      Color(0xff1E335A), // Bright Coral Red
      Color(0xff0E1A35),
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
