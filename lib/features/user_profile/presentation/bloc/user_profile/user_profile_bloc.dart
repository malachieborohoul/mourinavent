import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/common/entities/user.dart';
import 'package:rinavent/features/user_profile/domain/usecases/complete_user_profile.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final CompleteUserProfile _completeUserProfile;
  final AppUserCubit _appUserCubit;
  UserProfileBloc({
    required CompleteUserProfile completeUserProfile,
    required AppUserCubit appUserCubit,
  })  : _completeUserProfile = completeUserProfile,
        _appUserCubit = appUserCubit,
        super(UserProfileInitial()) {
    on<UserProfileEvent>((event, emit) => emit(UserProfileLoading()));
    on<UserProfileCompleteUserProfile>(_onCompleteUserProfile);
  }

  void _onCompleteUserProfile(UserProfileCompleteUserProfile event,
      Emitter<UserProfileState> emit) async {
    final res = await _completeUserProfile(CompleteUserProfileParams(
        id: event.id,
        email: event.email,
        name: event.name,
        gender: event.gender,
        age: event.age,
        phoneNumber: event.phoneNumber,
        countryCode: event.countryCode,
        image: event.image,
        selectedCategories: event.selectedCategories));

    res.fold((l) => emit(UserProfileFailure(l.message)), (r) {
      _appUserCubit.updateUser(r);
      emit(UserProfileSuccess(r));
    });
  }
}
