import 'package:flutter/material.dart';
import 'package:lanars_tech_task/core/theme/theme.dart';

class AppTextStyles {
  static TextStyle titleText = TextStyle(
    color: lightColorScheme.onSurface,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );
  static TextStyle mediumBodyText = TextStyle(
    color: lightColorScheme.onSurface,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle smallBodyText = TextStyle(
    color: lightColorScheme.onSurface,
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle buttonText = TextStyle(
    color: lightColorScheme.onPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h2Text = TextStyle(
    color: lightColorScheme.secondary,
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );
}
