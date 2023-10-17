part of 'auth_state_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String password;
  LoginEvent({required this.password});
}

class LogoutEvent extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String password;
  RegisterEvent({required this.password});
}
