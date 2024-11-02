import 'package:allam_challenge/coding_files/color_pallete.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: whiteColor,
  colorScheme: ColorScheme.fromSeed(seedColor: mainGreenColor),
  useMaterial3: true,
  fontFamily: 'Cairo',
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: mainGreenColor,
  colorScheme: ColorScheme.fromSeed(seedColor: mainGreenColor),
  useMaterial3: true,
  fontFamily: 'Cairo',
);
