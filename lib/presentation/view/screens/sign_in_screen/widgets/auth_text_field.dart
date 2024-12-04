import 'package:flutter/material.dart';
import 'package:lanars_tech_task/core/theme/app_text_styles.dart';
import 'package:lanars_tech_task/core/theme/theme.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    required this.controller,
    this.hint,
    this.label,
    this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.errorText,
    super.key,
  });

  final TextEditingController controller;
  final String? hint;
  final String? label;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        autovalidateMode: AutovalidateMode.disabled,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hint ?? "",
          label: Text(label!),
          errorText: errorText,
          border: const OutlineInputBorder(),
          labelStyle: AppTextStyles.mediumBodyText.copyWith(
            color: enabled
                ? lightColorScheme.onSurfaceVariant
                : lightColorScheme.outlineVariant,
          ),
          hintStyle: AppTextStyles.mediumBodyText.copyWith(
            color: enabled
                ? lightColorScheme.onSurfaceVariant
                : lightColorScheme.outlineVariant,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
