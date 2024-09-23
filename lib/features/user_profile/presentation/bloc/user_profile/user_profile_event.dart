part of 'user_profile_bloc.dart';

sealed class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}


final class UserProfileCompleteUserProfile extends UserProfileEvent{
  final String id;
  final String email;
  final String name;
  final String gender;
  final int age;
  final String phoneNumber;
  final String countryCode;
  final File? image;
  final List<Category> selectedCategories;

  const UserProfileCompleteUserProfile(this.id, this.email, this.name, this.gender, this.age, this.phoneNumber, this.countryCode, this.image, this.selectedCategories);
}