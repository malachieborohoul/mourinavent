import 'package:equatable/equatable.dart';
import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/usecase/usecase.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/user_profile/domain/repositories/user_profile_repository.dart';

class CompleteUserProfile implements Usecase<void, CompleteUserProfileParams> {
  final UserProfileRepository userProfileRepository;

  CompleteUserProfile(this.userProfileRepository);
  @override
  ResultFuture<void> call(CompleteUserProfileParams params) async {
    return await userProfileRepository.completeUserProfile(
        name: params.name,
        gender: params.gender,
        age: params.age,
        phoneNumber: params.phoneNumber,
        countryCode: params.countryCode,
        selectedCategories: params.selectedCategories);
  }
}

class CompleteUserProfileParams extends Equatable {
  final String name;
  final String gender;
  final String age;
  final String phoneNumber;
  final String countryCode;
  final List<Category> selectedCategories;

  const CompleteUserProfileParams(this.selectedCategories,
      {required this.name,
      required this.gender,
      required this.age,
      required this.phoneNumber,
      required this.countryCode});

  @override
  List<Object?> get props => throw UnimplementedError();
}
