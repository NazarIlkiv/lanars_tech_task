import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_tech_task/core/constants/app_strings.dart';
import 'package:lanars_tech_task/core/theme/app_text_styles.dart';
import 'package:lanars_tech_task/core/theme/theme.dart';
import 'package:lanars_tech_task/presentation/state/auth/auth_cubit.dart';

class LogOutModalWindow extends StatelessWidget {
  const LogOutModalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: lightColorScheme.onPrimary,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.logOut,
              style: AppTextStyles.titleText.copyWith(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              AppStrings.areYouSureToWantToLogOut,
              style: AppTextStyles.mediumBodyText.copyWith(
                fontWeight: FontWeight.w400,
                color: lightColorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    AppStrings.cancel,
                    style: AppTextStyles.mediumBodyText.copyWith(
                      color: lightColorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<AuthCubit>().logout();
                  },
                  child: Text(
                    AppStrings.logOut,
                    style: AppTextStyles.mediumBodyText.copyWith(
                      color: lightColorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
