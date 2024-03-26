import 'package:flutter/material.dart';

import 'package:curtian_app/page_gallery/constants/app_color.dart';

import 'constants.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: LightThemeColor.primaryLight,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightThemeColor.accent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black45),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          LightThemeColor.accent,
        ),
      ),
    ),
    hintColor: Colors.black45,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      fillColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: LightThemeColor.accent,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      bodyLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.black45,
      ),
      titleMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black45,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black45),
    bottomAppBarTheme: const BottomAppBarTheme(color: kwhiteColor),
  );

  static ThemeData darkTheme = ThemeData(
    canvasColor: DarkThemeColor.primaryDark,
    scaffoldBackgroundColor: DarkThemeColor.primaryDark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: LightThemeColor.accent,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarTextStyle: TextStyle(color: kwhiteColor),
      centerTitle: true,
      iconTheme: IconThemeData(color: kwhiteColor),
      titleTextStyle: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          LightThemeColor.accent,
        ),
      ),
    ),
    hintColor: Colors.white60,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      filled: true,
      contentPadding: const EdgeInsets.all(20),
      fillColor: DarkThemeColor.primaryLight,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: DarkThemeColor.primaryLight,
      selectedItemColor: LightThemeColor.accent,
      unselectedItemColor: Colors.white70,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ).copyWith(color: kwhiteColor),
      displayMedium: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ).copyWith(color: kwhiteColor),
      displaySmall: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ).copyWith(color: kwhiteColor),
      headlineMedium: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ).copyWith(color: kwhiteColor),
      headlineSmall: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ).copyWith(color: kwhiteColor),
      bodyLarge: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.black45,
      ).copyWith(color: kwhiteColor),
      titleMedium: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black45,
      ).copyWith(color: Colors.white60),
    ),
    iconTheme: const IconThemeData(color: kwhiteColor),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: DarkThemeColor.primaryLight,
    ),
  );
}
