part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryFailure extends CategoryState {
  final String error;

  const CategoryFailure(this.error);
}

final class CategorySuccess extends CategoryState {
  final List<Category> categories;

  const CategorySuccess(this.categories);
}
