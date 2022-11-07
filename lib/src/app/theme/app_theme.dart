import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/constants/const.dart';

class AppTheme {
  late double _textHeight;
  late bool _isLatinAlphabet;
  late String _fontName;

  AppTheme({
    required BuildContext context,
  }) {
    _isLatinAlphabet = context.locale.countryCode == kUS;
    _fontName = _isLatinAlphabet ? "Gotham" : "Rabar";
    _textHeight = 1;
  }

  ThemeData getDarkThemeData() {
    final ThemeData themeData = ThemeData(
      highlightColor: kDarkGrayColor,
      canvasColor: kLightGrayColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: kLightGrayColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: kDarkGrayColor,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          side: const BorderSide(color: kBlueColorLight),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: kBlueColorLight,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: kBlueColorLight,
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: kLightGrayColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 22,
        ),
        errorMaxLines: 5,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.white,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorStyle: TextStyle(
          height: _textHeight,
          fontSize: 16,
          fontFamily: '${_fontName}Book',
        ),
        hintStyle: TextStyle(
          height: _textHeight,
          fontSize: 16,
          fontFamily: '${_fontName}Book',
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: kLightGrayColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: kLightGrayColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kBlueColorLight,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: getTextTheme(Colors.white),
    );

    return themeData.copyWith(
      colorScheme: themeData.colorScheme.copyWith(
        secondary: const Color(0xff52B1E4),
        onPrimary: Colors.white,
      ),
    );
  }

  ThemeData getLightThemeData() {
    final ThemeData themeData = ThemeData(
      highlightColor: kOffWhiteColor,
      canvasColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      scaffoldBackgroundColor: kOffWhiteColor,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          side: const BorderSide(color: kBlueColorDark),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: kBlueColorDark,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: kBlueColorDark,
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 22,
        ),
        errorMaxLines: 5,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(width: 2, color: Colors.black),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(width: 2, color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(
            width: 0.5,
            color: Colors.black,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(color: Colors.black),
        ),
        errorStyle: TextStyle(
          height: _textHeight,
          fontSize: 12,
          color: Colors.red,
          fontFamily: '${_fontName}Book',
        ),
        hintStyle: TextStyle(
          height: _textHeight,
          fontSize: 12,
          fontFamily: '${_fontName}Book',
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kBlueColorDark,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: getTextTheme(Colors.black),
    );

    return themeData.copyWith(
      colorScheme: themeData.colorScheme.copyWith(
        secondary: kBlueColorDark,
        onPrimary: Colors.black,
      ),
    );
  }

  TextTheme getTextTheme(Color color) {
    return TextTheme(
      headline1: TextStyle(
        height: _textHeight,
        fontSize: 24,
        fontFamily: '${_fontName}Bold',
        color: color,
      ),
      headline2: TextStyle(
        height: _textHeight,
        fontSize: _isLatinAlphabet ? 16 : 18,
        fontFamily: '${_fontName}Bold',
        color: color,
      ),
      headline3: TextStyle(
        height: _textHeight,
        fontSize: _isLatinAlphabet ? 16 : 18,
        fontFamily: '${_fontName}Medium',
        color: color,
      ),
      headline4: TextStyle(
        height: _textHeight,
        fontSize: _isLatinAlphabet ? 16 : 18,
        fontFamily: '${_fontName}Book',
        color: color,
      ),
      subtitle1: TextStyle(
        height: _textHeight,
        fontSize: 14,
        fontFamily: '${_fontName}Medium',
        color: color,
      ),
      subtitle2: TextStyle(
        height: _textHeight,
        fontSize: 14,
        fontFamily: '${_fontName}Book',
        color: color,
      ),
      bodyText1: TextStyle(
        height: _textHeight,
        fontSize: 12,
        fontFamily: '${_fontName}Medium',
        color: color,
      ),
      bodyText2: TextStyle(
        height: _textHeight,
        fontSize: 12,
        fontFamily: '${_fontName}Book',
        color: color,
      ),
      caption: TextStyle(
        height: _textHeight,
        fontSize: 10,
        fontFamily: '${_fontName}Book',
        color: color,
      ),
      button: TextStyle(
        fontSize: 14,
        fontFamily: '${_fontName}Medium',
        color: Colors.white,
      ),
    );
  }
}
