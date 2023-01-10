import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
    titleTextStyle: TextStyle(color: Colors.amber,
        fontSize: 28.sp),
    iconTheme: const IconThemeData(
      color: Colors.black
    ),
  ),
);