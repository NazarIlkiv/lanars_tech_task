import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lanars_tech_task/data/models/user_model.dart';

import 'package:lanars_tech_task/data/repositories/repository_impl/user_repository/user_repository_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _repository;

  UserCubit(this._repository) : super(UserLoadingState());

  Future<void> fetchUserData(String email, String password) async {
    emit(UserLoadingState());
    developer.log('Request Body: "email": $email, "password": $password');
    try {
      final userData = await _repository.fetchUser();
      emit(UserLoadedState(userData));
    } catch (e) {
      developer.log('Error fetching user data: $e');
      emit(UserErrorState("Failed to fetch user data: ${e.toString()}"));
    }
  }
}
