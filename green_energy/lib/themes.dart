import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';

ThemeData myLightTheme = AppTheme.light().data.copyWith(
      backgroundColor: Color(0xffFBF8F3),
      primaryColor: Colors.white,
      accentColor: Colors.yellow,
      focusColor: Colors.green.shade300,
      shadowColor: Colors.black.withOpacity(0.1),
      textTheme: TextTheme(
        bodyText1: GoogleFonts.quicksand().copyWith(color: Colors.black),
      ),
    );
