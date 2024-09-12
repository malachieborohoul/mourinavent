import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/common/entities/category.dart';
import 'package:rinavent/features/user_profile/domain/usecases/get_categories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories _getCategories;
  CategoryBloc({required GetCategories getCategories})
      : _getCategories = getCategories,
        super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) => emit(CategoryLoading()));
    on<CategoryLoadCategories>(_onLoadCategories);
  }

  void _onLoadCategories(
      CategoryLoadCategories event, Emitter<CategoryState> emit) async {
    final res = await _getCategories();

    res.fold(
      (l) => emit(CategoryFailure(l.message)),
      (r) => emit(CategorySuccess(r)),
    );
  }
}
