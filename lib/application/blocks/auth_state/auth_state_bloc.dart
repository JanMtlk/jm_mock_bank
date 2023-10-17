import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'auth_state_event.dart';
part 'auth_state_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthStateUnauthenticated()) {
    on<LoginEvent>((event, emit) async {
      Logger().i("LoginEvent was called");
      emit(const AuthStateLoading());
      await Future.delayed(const Duration(seconds: 1), () {
        Logger().i("LoginEvent");
        emit(const AuthStateAuthenticated(id: "1234567890"));
      });
    });
  }
}
