// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/core/usecase/usecase.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/user_profile/domain/repositories/category_repository.dart';

class GetCategories implements UsecaseWithoutParams {
  CategoryRepository categoryRepository;
  GetCategories(
    this.categoryRepository,
  );
  @override
  ResultFuture<List<Category>> call() async {
    final result = await categoryRepository.getCategories();
    
    return result;
  }
}
