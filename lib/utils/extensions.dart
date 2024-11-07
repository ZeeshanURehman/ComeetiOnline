import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension EmptySpace on num
{
  SizedBox get ht => SizedBox(height:toDouble().h);
  SizedBox get wd => SizedBox(width:toDouble().w);
}