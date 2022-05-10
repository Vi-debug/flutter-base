import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';
import 'font_family.dart';

final ThemeData themeData = ThemeData(
    fontFamily: FontFamily.roboto,
    brightness: Brightness.light,
    primarySwatch: MaterialColor(AppColors.primary[500]!.value, AppColors.primary),
    primaryColor: AppColors.colorMain,
    textTheme: TextTheme(bodyText2: TextStyle(fontSize: 28.0.sp)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.colorMain,
        textStyle: textButtonTheme,
        padding: EdgeInsets.symmetric(vertical: 24.h)
      )
    )

);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.roboto,
  brightness: Brightness.dark,
  primaryColor: AppColors.primary[500],
);

var textButtonTheme = TextStyle(
    fontSize: 30.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600
);

final textTitleCategory = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600
);

final textTitleLoginStyle = TextStyle(
  fontSize: 48.sp,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

final textFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(3)
);

final textTitleStyle = TextStyle(
  fontSize: 32.h,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
