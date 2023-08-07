import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yogify/source/constants/colors.dart';
import 'package:yogify/source/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:yogify/source/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:yogify/source/utils/theme/widget_themes/text_theme.dart';

class TAppTheme{

TAppTheme._();

  static ThemeData lightTheme=ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme:TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    );
    
  static ThemeData darkTheme=ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.teal,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    );
}