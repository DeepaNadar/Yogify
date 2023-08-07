import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme{
  static TextTheme lightTextTheme=TextTheme(
      headline2: GoogleFonts.abel(
        color:Colors.black,
      ),
      headline3: GoogleFonts.abel(
        color:Colors.black,
      ),
      headline4: GoogleFonts.poppins(
        color:Colors.black,
      ),
      headline5: GoogleFonts.poppins(
        color:Colors.black,
      ),
      bodyText1: GoogleFonts.poppins(
        color:Colors.black,
      ),
      subtitle2: GoogleFonts.poppins(
        color:Colors.black,
        fontSize: 24,
      )
    );
  static TextTheme darkTextTheme=TextTheme(
      headline2: GoogleFonts.montserrat(
        color:Colors.white,
      ),
      headline4: GoogleFonts.poppins(
        color:Colors.white,
      ),
      headline5: GoogleFonts.poppins(
        color:Colors.white,
      ),
      bodyText1: GoogleFonts.poppins(
        color:Colors.white,
      ),
      subtitle2: GoogleFonts.poppins(
        color:Colors.white,
        fontSize: 24,
      )
    );
}