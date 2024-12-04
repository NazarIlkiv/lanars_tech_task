
part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isLoggedIn;

  const AuthState({required this.isLoggedIn});

  @override
  List<Object?> get props => [isLoggedIn];

  AuthState copyWith({bool? isLoggedIn}) {
    return AuthState(isLoggedIn: isLoggedIn ?? this.isLoggedIn);
  }

  Map<String, dynamic> toJson() {
    return {'isLoggedIn': isLoggedIn};
  }

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(isLoggedIn: json['isLoggedIn'] as bool);
  }
}