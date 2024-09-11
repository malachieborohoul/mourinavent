import 'package:rinavent/features/user_profile/data/models/category_model.dart';

abstract interface class CategoryRemoteDatasource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDatasourceImpl implements CategoryRemoteDatasource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
    } catch (e) {
      
    }
  }
}
