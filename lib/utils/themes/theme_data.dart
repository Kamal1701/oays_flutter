import 'package:flutter/material.dart';
import 'package:oays/utils/helpers/color_constant.dart';

class ThemeClass {
  // Color lightPrimaryColor = hexStringToColor('#edd38c');
  Color lightPrimaryColor = primaryLightColor;
  Color bgDarkColor = bgdDarkColor;
  Color txtFieldBorderColor = txtBorderColor;
  Color txtFieldFillColor = txtFillColor;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark()
        .copyWith(primary: _themeClass.lightPrimaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // minimumSize: MaterialStateProperty.all(
        //   const Size(double.infinity, 55),
        // ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => _themeClass.bgDarkColor,
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (_) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            );
          },
        ),
        textStyle:
            MaterialStateProperty.resolveWith((states) => const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                )),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _themeClass.txtFieldFillColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: _themeClass.txtFieldBorderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide(
          color: _themeClass.txtFieldBorderColor,
        ),
      ),
      hintStyle: TextStyle(
        color: hintTextColor,
      ),
    ),
    // listTileTheme: const ListTileThemeData(
    //   tileColor: Color.fromRGBO(247, 224, 163, 1),
    //   selectedTileColor: Color.fromRGBO(230, 185, 67, 1),
    // ),
  );
}

ThemeClass _themeClass = ThemeClass();
