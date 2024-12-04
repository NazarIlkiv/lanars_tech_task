import 'package:flutter/material.dart';
import 'package:lanars_tech_task/constants/app_strings.dart';
import 'package:lanars_tech_task/theme/app_text_styles.dart';
import 'package:lanars_tech_task/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const Scaffold(
        body: Center(
          child: Text(
            AppStrings.helloWorld,
            style: AppTextStyles.titleText,
            ),
        ),
      ),
    );
  }
}
