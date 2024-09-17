import 'dart:io';

import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/common/entities/user.dart';
import 'package:rinavent/core/utils/typedef.dart';

abstract interface class UserProfileRepository {
  ResultFuture<User> completeUserProfile({
    required String id,
    required String email,
    required String name,
    required String gender,
    required String age,
    required String phoneNumber,
    required String countryCode,
    required File image,
    required List<Category> selectedCategories
  });
}
