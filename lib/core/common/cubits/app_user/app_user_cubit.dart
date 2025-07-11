import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/domain/entities/user.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());


    void updateUser(User? user) {
      emit(AppUserLoading());
    if (user == null) {
      emit(AppUserInitial());
    } else {
      debugPrint("Current state before emitting: $state");
      // debugPrint("Updated user: ${user.firstName}");
      // debugPrint("Updated user: ${user.lastName}");
      // debugPrint("Updated user: ${user.balance}");
      emit(AppUserLoggedIn(user));
    }
  }
}
