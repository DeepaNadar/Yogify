import 'package:flutter/material.dart';
import 'package:yogify/source/constants/colors.dart';
import 'package:yogify/source/constants/sizes.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._();

static final lightElevatedButtonTheme=ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tWhiteColor,
                      side:BorderSide(color:tPrimaryColor),
                      padding:EdgeInsets.symmetric(vertical: tButtonHeight),
                    ),
);

static final darkElevatedButtonTheme=ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tDarkColor,
                      side:BorderSide(color:tPrimaryColor),
                      padding:EdgeInsets.symmetric(vertical: tButtonHeight),
                    ),
);

}