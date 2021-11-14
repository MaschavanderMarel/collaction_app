import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData lightTheme(BuildContext context) {
  final theme = ThemeData.light();

  return theme.copyWith(
    primaryColor: kPrimaryColor,
    colorScheme: theme.colorScheme.copyWith(secondary: kAccentColor),
    primaryColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: theme.textTheme.apply(
      fontFamily: 'Rubik',
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: kPrimaryColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: kAccentColor,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
      labelStyle: TextStyle(color: kInactiveColor),
      filled: true,
      fillColor: kAlmostTransparent,
      focusColor: kInactiveColor,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.zero,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: kAccentColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.zero,
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: kErrorColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.zero,
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: kErrorColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.zero,
      ),
      contentPadding: EdgeInsets.all(10.0),
    ),
  );
}
