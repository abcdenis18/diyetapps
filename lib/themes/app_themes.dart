import 'package:flutter/material.dart';

Color appColorPrimary = const Color(0xff4B61D6);
Color appColorBackground =  Colors.white;

var appThemeLight = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: appColorPrimary),
  scaffoldBackgroundColor: appColorBackground,
  primaryColor: appColorPrimary,
);