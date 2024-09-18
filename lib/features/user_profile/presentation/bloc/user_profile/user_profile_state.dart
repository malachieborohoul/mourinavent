part of 'user_profile_bloc.dart';

sealed class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

final class UserProfileInitial extends UserProfileState {}

final class UserProfileLoading extends UserProfileState {}

final class UserProfileFailure extends UserProfileState {
  final String message;

  const UserProfileFailure(this.message);
}

final class UserProfileSuccess extends UserProfileState {
  final User user;

  const UserProfileSuccess(this.user);
}
