import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lanars_tech_task/data/network/dio_config.dart';
import 'package:lanars_tech_task/data/repositories/repository_impl/photos_list_repository/photo_list_repository_impl.dart';
import 'package:lanars_tech_task/data/repositories/repository_impl/user_repository/user_repository_impl.dart';
import 'package:lanars_tech_task/presentation/state/auth/auth_cubit.dart';
import 'package:lanars_tech_task/presentation/state/photosList/photo_list_cubit.dart';
import 'package:lanars_tech_task/presentation/state/user/user_cubit.dart';

final getIt = GetIt.instance;

void injectionContainer() {
  getIt
    ..registerSingleton<Dio>(DioConfig.createDio())
    ..registerSingleton<UserRepository>(
      UserRepository(getIt<Dio>()),
    )
    ..registerSingleton<PhotoListRepository>(
      PhotoListRepository(getIt<Dio>()),
    )
    ..registerSingleton<AuthCubit>(
      AuthCubit(),
    )
    ..registerSingleton<UserCubit>(
      UserCubit(getIt<UserRepository>()),
    )
    ..registerSingleton<PhotoListCubit>(
      PhotoListCubit(getIt<PhotoListRepository>()),
    );
}
