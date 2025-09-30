
import 'package:flutter/material.dart';
import 'package:news_app/src/theme/color/dark_color.dart';

import 'color/lightColor.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
    primaryColor: LightColor.purple,
    primaryColorDark: LightColor.Darker,
    primaryColorLight: LightColor.brighter,
    cardTheme: CardThemeData(color: LightColor.background),
    textTheme: ThemeData.light().textTheme,
    iconTheme: IconThemeData(color: LightColor.lightblack),
    dividerColor: LightColor.lightGrey,
    disabledColor: LightColor.darkgrey, colorScheme: ColorScheme(
        primary: LightColor.purple,
        primaryContainer: LightColor.purple,
        secondary: LightColor.lightBlue,
        secondaryContainer: LightColor.darkBlue,
        surface: LightColor.background,
        error: Colors.red,
        onPrimary: LightColor.Darker,
        onSecondary: LightColor.background,
        onSurface: LightColor.Darker,
        onError: LightColor.titleTextColor,
        brightness: Brightness.dark).copyWith(surface: LightColor.background).copyWith(secondary: LightColor.lightblack), bottomAppBarTheme: BottomAppBarTheme(color: LightColor.background),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: DarkColor.purple,
    primaryColorDark: DarkColor.Darker,
    primaryColorLight: DarkColor.brighter,
    cardTheme: CardThemeData(color: DarkColor.background),
    textTheme: ThemeData.dark()
        .textTheme
        .copyWith(bodyLarge: TextStyle(color: DarkColor.titleTextColor)),
    iconTheme: IconThemeData(color: DarkColor.lightblack),
    dividerColor: LightColor.subTitleTextColor, colorScheme: ColorScheme(
        primary: DarkColor.purple,
        primaryContainer: DarkColor.purple,
        secondary: DarkColor.lightBlue,
        secondaryContainer: DarkColor.darkBlue,
        surface: DarkColor.background,
        error: Colors.red,
        onPrimary: DarkColor.white,
        onSecondary: DarkColor.Darker,
        onSurface: DarkColor.white,
        onError: DarkColor.titleTextColor,
        brightness: Brightness.dark).copyWith(surface: DarkColor.background).copyWith(secondary: DarkColor.lightblack), bottomAppBarTheme: BottomAppBarTheme(color: DarkColor.lightblack),
  );

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}
