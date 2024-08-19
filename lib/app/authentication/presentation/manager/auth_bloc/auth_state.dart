part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}
final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}
final class AuthLoginSuccess extends AuthState {}
final class AuthLoginFailure extends AuthState {
  final String errorMessage;
  AuthLoginFailure({required this.errorMessage});
}

final class AuthRegisterLoading extends AuthState {}
final class AuthRegisterSuccess extends AuthState {}
final class AuthRegisterFailure extends AuthState {
  final String errorMessage;
  AuthRegisterFailure({required this.errorMessage});
}

final class AuthResetPasswordLoading extends AuthState {}
final class AuthResetPasswordSuccess extends AuthState {}
final class AuthResetPasswordFailure extends AuthState {
  final String errorMessage;
  AuthResetPasswordFailure({required this.errorMessage});
}
