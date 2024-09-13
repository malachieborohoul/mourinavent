import 'package:rinavent/core/error/exceptions.dart';
import 'package:rinavent/features/user_profile/data/models/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class CategoryRemoteDatasource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDatasourceImpl implements CategoryRemoteDatasource {
  final SupabaseClient supabaseClient;

  CategoryRemoteDatasourceImpl(this.supabaseClient);
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final categories = await supabaseClient.from('categories').select('*');
      return categories
          .map((category) => CategoryModel.fromMap(category))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
