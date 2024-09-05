import 'package:equatable/equatable.dart';
import 'package:mourinavent/core/usecase/usecase.dart';
import 'package:mourinavent/core/utils/typedef.dart';
import 'package:mourinavent/features/auth/domain/entities/user.dart';
import 'package:mourinavent/features/auth/domain/repositories/auth_repository.dart';

class UserSignUp implements Usecase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  @override
  ResultFuture<User> call(UserSignUpParams params) {
    return authRepository.signUp(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams extends Equatable {
  final String email;
  final String name;
  final String password;

  const UserSignUpParams(
      {required this.email, required this.name, required this.password});

  @override
  List<Object?> get props => [email, name, password];
}
