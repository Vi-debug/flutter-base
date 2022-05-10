import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> primary = <int, Color>{
    50: Color(0xFFE1E6F2),
    100: Color(0xFFB5C1DE),
    200: Color(0xFF8497C9),
    300: Color(0xFF526DB3),
    400: Color(0xFF2D4EA2),
    500: Color(0xFF2D4EA2),
    600: Color(0xFF072A8A),
    700: Color(0xFF06237F),
    800: Color(0xFF041D75),
    900: Color(0xFF021263)
  };

  static const colorMain = Color(0xFF082F92);
  static const colorText = Color(0xFF333333);
  static const colorDivider = Color(0xFFF2F2F2);
  static const colorTextGrey = Color(0xFF999999);
  static const colorFileAttach = Color(0xFFDCE6FF);
  static const colorFileAttach70 = Color(0xB3DCE6FF);
  static const colorC4C4C4 = Color(0xFFC4C4C4);
}
