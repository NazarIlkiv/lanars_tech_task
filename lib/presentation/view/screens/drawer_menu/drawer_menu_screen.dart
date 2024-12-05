import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_tech_task/core/constants/app_strings.dart';
import 'package:lanars_tech_task/core/theme/app_text_styles.dart';
import 'package:lanars_tech_task/presentation/state/user/user_cubit.dart';
import 'package:lanars_tech_task/presentation/view/screens/drawer_menu/widgets/log_out_modal_window.dart';

class DrawerMenuScreen extends StatefulWidget {
  const DrawerMenuScreen({super.key});

  @override
  State<DrawerMenuScreen> createState() => _DrawerMenuScreenState();
}

class _DrawerMenuScreenState extends State<DrawerMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            AppStrings.profile,
            style: AppTextStyles.mediumBodyText,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            _userProfile(context),
            const Spacer(),
            _logoutButton(context),
            const SizedBox(height: 65.0),
          ],
        ),
      ),
    );
  }

  Widget _userProfile(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoadedState) {
          final userFirstName = state.user.name.first;
          final userLastName = state.user.name.last;
          final userEmail = state.user.email;
          final userImageUrl = state.user.picture.medium;
          return Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 36.0,
                        backgroundImage: NetworkImage(userImageUrl),
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                userFirstName,
                                style: AppTextStyles.mediumBodyText,
                              ),
                              const SizedBox(width: 6.0),
                              Text(
                                userLastName,
                                style: AppTextStyles.mediumBodyText,
                              ),
                            ],
                          ),
                          Text(
                            userEmail,
                            style: AppTextStyles.smallBodyText.copyWith(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _logoutButton(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(CupertinoIcons.square_arrow_right),
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => const LogOutModalWindow(),
            );
          },
        ),
        Text(
          AppStrings.logOut,
          style: AppTextStyles.mediumBodyText,
        ),
      ],
    );
  }
}
