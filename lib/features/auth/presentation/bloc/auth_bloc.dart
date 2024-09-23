import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:rinavent/core/common/entities/user.dart';
import 'package:rinavent/features/auth/domain/usecases/current_user.dart';
import 'package:rinavent/features/auth/domain/usecases/sign_up_with_apple.dart';
import 'package:rinavent/features/auth/domain/usecases/sign_up_with_google.dart';
import 'package:rinavent/features/auth/domain/usecases/user_sign_in.dart';
import 'package:rinavent/features/auth/domain/usecases/user_sign_out.dart';
import 'package:rinavent/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final UserSignOut _userSignOut;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  final SignUpWithGoogle _signUpWithGoogle;
  final SignUpWithApple _signUpWithApple;
  // final SignInWithGoogle _signInWithGoogle;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required UserSignOut userSignOut,
    required SignUpWithGoogle signUpWithGoogle,
    // required SignInWithGoogle signInWithGoogle,
    required SignUpWithApple signUpWithApple,

    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _userSignOut = userSignOut,
        _signUpWithGoogle = signUpWithGoogle,
        _signUpWithApple = signUpWithApple,
        // _signInWithGoogle = signInWithGoogle,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));

    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthSignOut>(_onAuthSignOut);
    on<AuthSignUpWithGoogle>(_onAuthSignUpWithGoogle);
    on<AuthSignUpWithApple>(_onAuthSignUpWithApple);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser();

    res.fold(
        (l) => emit(AuthFailure(l.message)), (r) => _emitAuthSucces(r, emit));
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final res = await _userSignUp(UserSignUpParams(
        email: event.email, name: event.name, password: event.password));

    res.fold(
        (l) => emit(AuthFailure(l.message)), (r) => _emitAuthSucces(r, emit));
  }

  void _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    final res = await _userSignIn(
        UserSignInParams(email: event.email, password: event.password));

    res.fold(
        (l) => emit(AuthFailure(l.message)), (r) => _emitAuthSucces(r, emit));
  }

    void _onAuthSignOut(AuthSignOut event, Emitter<AuthState> emit) async {
    final res = await _userSignOut(
        );

    res.fold(
        (l) => emit(AuthFailure(l.message)), (r) {
                _appUserCubit.updateUser(null);

      emit(AuthSignOutSuccess());
        });
  }

  void _onAuthSignUpWithGoogle(
      AuthSignUpWithGoogle event, Emitter<AuthState> emit) async {
    final res = await _signUpWithGoogle();

    res.fold((l) => emit(AuthFailure(l.message)), (r)=>_emitAuthSucces(r, emit));
  }


    void _onAuthSignUpWithApple(
      AuthSignUpWithApple event, Emitter<AuthState> emit) async {
    final res = await _signUpWithApple();

    res.fold((l) => emit(AuthFailure(l.message)), (r)=>_emitAuthSucces(r, emit));
  }

  void _emitAuthSucces(User user, Emitter<AuthState> emit) async {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
