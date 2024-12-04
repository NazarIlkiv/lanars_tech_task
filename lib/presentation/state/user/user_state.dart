part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final UserModel user;

  const UserLoadedState(this.user);

  @override
  List<Object?> get props => [user];
}

class UserErrorState extends UserState {
  final String errorMessage;

  const UserErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class UserEmptyState extends UserState {}
