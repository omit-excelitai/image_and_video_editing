import 'package:flutter/material.dart';

class AppColorResources {
  /// For Use This App
  static const Color appBackgroundColor = Colors.black;
  static const Color buttonColorBlue = Color(0xff39A5EF);
  static const Color scaffoldBgColor = Color(0xffffffff);
  static const Color primaryGreen = Colors.green;


  static const Color buttonColor = Color(0xff453984);
  static const Color buttonColorRed = Color(0xffED3E3E);
  static const Color buttonColorGreenAccent = Color(0xff1DC68C);
  static const Color primaryWhite = Color(0xffFFFFFF);
  static const Color secondaryBlackTextColor = Color(0xff5C5B63);
  static const Color secondaryBlack54 = Color(0xffB6B6B6);
  static const Color primaryBlueAccent = Color(0xffB6B6B6);
  static const Color textFieldTextColor = Color(0xffCBCBCB);
  static const Color shadowColor =
  Color(0xff453984); // 10% Opacity // 20% Opacity
  static const Color appBarColor = Color(0xffF8F6FF);
  static const Color appBarActionColor = Color(0xffADADAD);
  static const Color tableHeaderColor = Color(0xffECEBF3);
  static const Color tableColumColor = Color(0xffEBF6FD);
  static const Color appDrawerColor = Color(0xff453984);
  static const Color cardBackgroundColor = Color(0XFFF4F4FF);
  static const Color disableSwitchColor = Color(0xffA9A9A9);
  static const Color enableSwitchColor = Color(0xffD3CCFA);
  static const Color borderColor = Color(0xffEFECFF);
  static const Color drawerItemColor = Color(0xff646464);
  static const Color primaryBlack = Color(0xff000000);
  static const Color primaryOrange = Colors.orange;



  /// Map Color
  static const Map<int, Color> colorMap = {
    50: Color(0x102D9FB8),
    100: Color(0x202D9FB8),
    200: Color(0x302D9FB8),
    300: Color(0x402D9FB8),
    400: Color(0x502D9FB8),
    500: Color(0x602D9FB8),
    600: Color(0x702D9FB8),
    700: Color(0x802D9FB8),
    800: Color(0x902D9FB8),
    900: Color(0xFF2D9FB8),
  };

  /// Map Color2
  static const Map<int, Color> colorMap2 = {
    50: Color(0x100F2333),
    100: Color(0x200F2333),
    200: Color(0x300F2333),
    300: Color(0x400F2333),
    400: Color(0x500F2333),
    500: Color(0x600F2333),
    600: Color(0x700F2333),
    700: Color(0x800F2333),
    800: Color(0x900F2333),
    900: Color(0xFF0F2333),
  };

  static const MaterialColor primaryMaterial =
      MaterialColor(0xFF2D9FB8, colorMap);
  static const MaterialColor statusBarColor =
      MaterialColor(0xff0F2333, colorMap2);
}
