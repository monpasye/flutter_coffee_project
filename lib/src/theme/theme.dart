import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/src/theme/appcolors.dart';

final theme = ThemeData(
  cardTheme: const CardTheme(
    color: AppColors.white,
    margin: EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
    fontFamily: 'Montserrat600',
    fontSize: 32,
    color: AppColors.black,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Montserrat500',
    fontSize: 16,
    color: AppColors.black,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Montserrat400',
    fontSize: 14,
    color: AppColors.black,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Montserrat400',
    fontSize: 12,
    color: AppColors.white,
  ),
  ),

  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(AppColors.bas),
    ),
  ),
);