import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lanars_tech_task/core/theme/theme.dart';
import 'package:lanars_tech_task/core/utils/di/injection.dart';
import 'package:lanars_tech_task/presentation/state/auth/auth_cubit.dart';
import 'package:lanars_tech_task/presentation/state/user/user_cubit.dart';
import 'package:lanars_tech_task/presentation/view/screens/main_screen/main_screen.dart';
import 'package:lanars_tech_task/presentation/view/screens/sign_in_screen/sign_in_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  configureDependencies();

  runApp(const MainApp());
}

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
      ],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return state.isLoggedIn ? const MainScreen() : const SignInScreen();
          },
        ),
      ),
    );
  }
}
