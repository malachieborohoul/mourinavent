import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mourinavent/features/auth/domain/entities/user.dart';
import 'package:mourinavent/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));

    on<AuthSignUp>(_onAuthSignUp);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final res = await _userSignUp(UserSignUpParams(
        email: event.email, name: event.name, password: event.password));

    res.fold(
        (l) => emit(AuthFailure(l.message)), (r) => _emitAuthSucces(r, emit));
  }

  void _emitAuthSucces(User user, Emitter<AuthState> emit) async {
    // _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
