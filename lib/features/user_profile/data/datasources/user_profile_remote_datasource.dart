import 'package:rinavent/core/common/entities/category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class UserProfileRemoteDatasource {


  Future<void> completeUserProfile(
      {required String name,
      required String gender,
      required String age,
      required String phoneNumber,
      required String countryCode,
      required List<Category> selectedCategories});
}

class UserProfileRemoteDatasourceImpl implements UserProfileRemoteDatasource{
  final SupabaseClient supabaseClient;

  UserProfileRemoteDatasourceImpl(this.supabaseClient);
  
  @override
  Future<void> completeUserProfile({required String name, required String gender, required String age, required String phoneNumber, required String countryCode, required List<Category> selectedCategories})async {
    // TODO: implement completeUserProfile
    throw UnimplementedError();
  }

}
