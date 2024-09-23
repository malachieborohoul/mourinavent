import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/error/exceptions.dart';
import 'package:rinavent/core/error/failures.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/auth/data/models/user_model.dart';
import 'package:rinavent/features/user_profile/data/datasources/user_profile_remote_datasource.dart';
import 'package:rinavent/features/user_profile/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDatasource userProfileRemoteDatasource;

  UserProfileRepositoryImpl(this.userProfileRemoteDatasource);
  @override
  ResultFuture<UserModel> completeUserProfile(
      {required String id,
      required String email,
      required String name,
      required String gender,
      required int age,
      required String phoneNumber,
      required String countryCode,
      required File? image,
      required List<Category> selectedCategories}) async {
    try {
      UserModel userModel = UserModel(
          id: id,
          email: email,
          name: name,
          updatedAt: DateTime.now(),
          gender: gender,
          age: age,
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          avatar: '');


    if (image != null){
      final imageUrl = await userProfileRemoteDatasource.uploadUserAvatar(
          image: image, userId: id);
      userModel = userModel.copyWith(avatar: imageUrl);

    }
      


      final user = await userProfileRemoteDatasource.completeUserProfile(userModel, selectedCategories);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
