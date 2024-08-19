import 'package:bloc/bloc.dart';
import 'package:connect_social_app/core/utils/auth.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final auth = Auth();
    final user = auth.currentUser;
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(AuthLoginLoading());
        try {
          await auth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(AuthLoginSuccess());
        } catch (e) {
          emit(AuthLoginFailure(errorMessage: e.toString()));
        }
      } else if (event is RegisterEvent) {
        emit(AuthRegisterLoading());
        try {
          await auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(AuthRegisterSuccess());
        } catch (e) {
          emit(AuthRegisterFailure(errorMessage: e.toString()));
        }
      }
    });
  }
}
