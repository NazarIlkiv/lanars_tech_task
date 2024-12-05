import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_tech_task/core/theme/theme.dart';
import 'package:lanars_tech_task/core/utils/di/injection_container.dart';
import 'package:lanars_tech_task/presentation/state/auth/auth_cubit.dart';
import 'package:lanars_tech_task/presentation/state/photosList/photo_list_cubit.dart';
import 'package:lanars_tech_task/presentation/state/user/user_cubit.dart';
import 'package:lanars_tech_task/presentation/view/screens/main_screen/main_screen.dart';
import 'package:lanars_tech_task/presentation/view/screens/sign_in_screen/sign_in_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => getIt<AuthCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => getIt<UserCubit>(),
        ),
        BlocProvider<PhotoListCubit>(
          create: (_) => getIt<PhotoListCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return state.isLoggedIn ? const MainScreen() : const SignInScreen();
          },
        ),
      ),
    );
  }
}
