part of 'complete_user_profile_cubit.dart';

abstract class CompleteUserProfileState extends Equatable {
  const CompleteUserProfileState({
    this.gender,
    this.age,
    this.avatar,
    this.categories,
  });

  final String? gender;
  final int? age;
  final File? avatar;
  final List<Category>? categories;

  CompleteUserProfileState copyWith({
    String? gender,
    int? age,
    File? avatar,
    List<Category>? categories,
  }) {
    return CompleteUserProfileUpdated(
      gender: gender ?? this.gender,
      age: age ?? this.age,
      avatar: avatar ?? this.avatar,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [gender, age, avatar, categories];
}

class CompleteUserProfileInitial extends CompleteUserProfileState {
  const CompleteUserProfileInitial()
      : super(gender: null, age: null, avatar: null, categories: const []);
}

class CompleteUserProfileUpdated extends CompleteUserProfileState {
  const CompleteUserProfileUpdated({
    super.gender,
    super.age,
    super.avatar,
    super.categories,
  });
}
