import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/utils/typedef.dart';

abstract interface class UserProfileRepository {
  ResultFuture<void> completeUserProfile({
    required String name,
    required String gender,
    required String age,
    required String phoneNumber,
    required String countryCode,
    required List<Category> selectedCategories
  });
}
