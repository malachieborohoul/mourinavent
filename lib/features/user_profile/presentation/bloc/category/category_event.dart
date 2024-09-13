part of 'category_bloc.dart';
@immutable
sealed class CategoryEvent extends Equatable {

  @override
  List<Object> get props => [];
}


final class CategoryLoadCategories extends CategoryEvent{

}
