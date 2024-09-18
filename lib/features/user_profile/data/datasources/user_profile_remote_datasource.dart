import 'dart:io';

import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/error/exceptions.dart';
import 'package:rinavent/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class UserProfileRemoteDatasource {
  Future<UserModel> completeUserProfile(
      UserModel user, List<Category> selectedCategories);

  Future<String> uploadUserAvatar({
    required File image,
    required String userId,
  });
}

class UserProfileRemoteDatasourceImpl implements UserProfileRemoteDatasource {
  final SupabaseClient supabaseClient;

  UserProfileRemoteDatasourceImpl(this.supabaseClient);

  @override
  Future<UserModel> completeUserProfile(
      UserModel user, List<Category> selectedCategories) async {
    try {
      final userData = await supabaseClient
          .from('profiles')
          .update(user.toMap())
          .eq('id', user.id)
          .select();

      final updatedUser = UserModel.fromMap(userData.first);

      //Delete former ctagories association

      await supabaseClient
          .from('profile_categories')
          .delete()
          .eq('profile_id', user.id);

      //Add new categories associations
      for (var category in selectedCategories) {
        await supabaseClient.from('profile_categories').insert({
          'profile_id': user.id,
          'category_id': category.id,
        });
      }

      return updatedUser;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadUserAvatar(
      {required File image, required String userId}) async {
    try {
      await supabaseClient.storage.from('avatars').upload(
            userId,
            image,
          );

      return supabaseClient.storage.from('avatars').getPublicUrl(
            userId,
          );
    } on StorageException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
