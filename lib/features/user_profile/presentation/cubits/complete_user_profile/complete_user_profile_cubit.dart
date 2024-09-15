import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rinavent/core/common/entities/category.dart';

part 'complete_user_profile_state.dart';

class CompleteUserProfileCubit extends Cubit<CompleteUserProfileState> {
  CompleteUserProfileCubit() : super(const CompleteUserProfileInitial());

  // Exemple de méthode pour sélectionner un genre
  void selectGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  // Exemple de méthode pour sélectionner l'âge
  void selectAge(int age) {
    emit(state.copyWith(age: age));
  }

  // Exemple de méthode pour sélectionner une liste de catégories
  void selectCategories(List<Category> categories) {
    emit(state.copyWith(categories: categories));
  }

  // Exemple de méthode pour changer l'avatar
  void selectAvatar(File avatar) {
    emit(state.copyWith(avatar: avatar));
  }
}
