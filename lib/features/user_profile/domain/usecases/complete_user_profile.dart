import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/common/entities/user.dart';
import 'package:rinavent/core/usecase/usecase.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/user_profile/domain/repositories/user_profile_repository.dart';

class CompleteUserProfile implements Usecase<void, CompleteUserProfileParams> {
  final UserProfileRepository userProfileRepository;

  CompleteUserProfile(this.userProfileRepository);
  @override
  ResultFuture<User> call(CompleteUserProfileParams params) async {
    return await userProfileRepository.completeUserProfile(
        id: params.id,
        email: params.email,
        name: params.name,
        gender: params.gender,
        age: params.age,
        phoneNumber: params.phoneNumber,
        countryCode: params.countryCode,
        image: params.image,
        selectedCategories: params.selectedCategories);
  }
}

class CompleteUserProfileParams extends Equatable {
  
  final String id;
  final String email;
  final String name;
  final String gender;
  final String age;
  final String phoneNumber;
  final String countryCode;
  final File image;
  final List<Category> selectedCategories;

  const CompleteUserProfileParams({
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    required this.countryCode,
    required this.image,
    required this.selectedCategories,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
