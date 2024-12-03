part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState({required this.message});
}

class AuthLoadedState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthloginState extends AuthState {
  final User user;

  const AuthloginState({required this.user});
}