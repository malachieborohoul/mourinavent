import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/utils/typedef.dart';

abstract interface class CategoryRepository {
  ResultFuture<List<Category>> getCategories();
}
