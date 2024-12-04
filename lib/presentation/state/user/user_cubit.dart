import 'dart:developer' as developer;

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lanars_tech_task/data/models/user_model.dart';
import 'package:lanars_tech_task/data/repositories/repository_impl/user_repository_impl.dart';

part 'user_state.dart';

class UserCubit extends HydratedCubit<UserState> {
  final UserRepository _repository;

  UserCubit(this._repository) : super(UserLoadingState());

  Future<void> fetchUserData(String email, String password) async {
    emit(UserLoadingState());
    developer.log('Request Body: "email": $email, "password": $password');
    try {
      final user = await _repository.fetchUser();
      emit(UserLoadedState(user));
    } catch (e) {
      emit(UserErrorState("Failed to fetch user data: $e"));
    }
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      final user = UserModel.fromJson(json);
      return UserLoadedState(user);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    if (state is UserLoadedState) {
      return state.user.toJson();
    }
    return null;
  }
}
