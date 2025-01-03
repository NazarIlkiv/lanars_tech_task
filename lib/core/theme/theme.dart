// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lanars_tech_task/core/theme/app_text_styles.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Roboto',
  colorScheme: lightColorScheme,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: lightColorScheme.outline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: lightColorScheme.primary,
        width: 2.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: lightColorScheme.error,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: lightColorScheme.error,
      ),
    ),
    labelStyle: AppTextStyles.mediumBodyText.copyWith(
      color: lightColorScheme.onSurfaceVariant,
    ),
    hintStyle: AppTextStyles.mediumBodyText.copyWith(
      color: lightColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: lightColorScheme.onPrimary,
      disabledBackgroundColor: lightColorScheme.primary,
      backgroundColor: lightColorScheme.primary,
      textStyle: AppTextStyles.buttonText,
      alignment: Alignment.center,
    ),
  ),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF0061A6),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD2E4FF),
  onPrimaryContainer: Color(0xFF001C37),
  secondary: Color(0xFF535F70),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD7E3F8),
  onSecondaryContainer: Color(0xFF101C2B),
  tertiary: Color(0xFF6B5778),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFF3DAFF),
  onTertiaryContainer: Color(0xFF251431),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  outline: Color(0xFF73777F),
  surface: Color(0xFFFAF9FC),
  onSurface: Color(0xFF1A1C1E),
  surfaceContainerHighest: Color(0xFFDFE2EB),
  onSurfaceVariant: Color(0xFF43474E),
  inverseSurface: Color(0xFF2F3033),
  onInverseSurface: Color(0xFFF1F0F4),
  inversePrimary: Color(0xFFA0CAFF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF0061A6),
  outlineVariant: Color(0xFFC3C6CF),
  scrim: Color(0xFF000000),
);
