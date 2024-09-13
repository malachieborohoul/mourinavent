import 'package:fpdart/fpdart.dart';
import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/error/exceptions.dart';
import 'package:rinavent/core/error/failures.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/user_profile/data/datasources/user_profile_remote_datasource.dart';
import 'package:rinavent/features/user_profile/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDatasource userProfileRemoteDatasource;

  UserProfileRepositoryImpl(this.userProfileRemoteDatasource);
  @override
  ResultFuture<void> completeUserProfile(
      {required String name,
      required String gender,
      required String age,
      required String phoneNumber,
      required String countryCode,
      required List<Category> selectedCategories}) async {
    try {
     userProfileRemoteDatasource.completeUserProfile(
          name: name,
          gender: gender,
          age: age,
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          selectedCategories: selectedCategories);
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
