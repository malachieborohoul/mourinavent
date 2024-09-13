// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/error/exceptions.dart';
import 'package:rinavent/core/error/failures.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/user_profile/data/datasources/category_remote_datasource.dart';
import 'package:rinavent/features/user_profile/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRemoteDatasource categoryRemoteDatasource;
  CategoryRepositoryImpl(
     this.categoryRemoteDatasource,
  );
  @override
  ResultFuture<List<Category>> getCategories() async {
    try {
      final categories = await categoryRemoteDatasource.getCategories();
      return right(categories);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
