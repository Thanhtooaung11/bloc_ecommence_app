part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserModel user;

  LoginSuccessState({required this.user});
}

class LoginFailedState extends AuthState {}
