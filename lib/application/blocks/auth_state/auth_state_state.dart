part of 'auth_state_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}

final class AuthStateAuthenticated extends AuthState {
  final String id;
  const AuthStateAuthenticated({required this.id});
}

final class AuthStateUnauthenticated extends AuthState {
  const AuthStateUnauthenticated();
}

final class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

final class AuthStateError extends AuthState {
  final String message;

  const AuthStateError({required this.message});
}

final class AuthStateUnknown extends AuthState {}
