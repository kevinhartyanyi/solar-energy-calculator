import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';

ThemeData myLightTheme = AppTheme.light().data.copyWith(
      backgroundColor: const Color(0xffFBF8F3),
      primaryColor: Colors.white,
      accentColor: const Color(0xff81B622), //Colors.yellow,
      focusColor: const Color(0xffECF87F),
      shadowColor: Colors.black.withOpacity(0.1),
      errorColor: Colors.red.shade400,
      textTheme: AppTheme.light().data.textTheme.copyWith(
            bodyText1: GoogleFonts.quicksand().copyWith(color: Colors.black),
          ),
    );

ThemeData myDarkTheme = AppTheme.dark().data.copyWith(
      backgroundColor: const Color(0xff36393F),
      primaryColor: const Color(0xff2F3136),
      accentColor: const Color(0xff81B622), //Colors.yellow,
      focusColor: const Color(0xffECF87F),
      shadowColor: Colors.white.withOpacity(0.1),
      errorColor: Colors.red.shade400,
      textTheme: AppTheme.dark().data.textTheme.copyWith(
            bodyText1: GoogleFonts.quicksand().copyWith(color: Colors.white),
          ),
    );
