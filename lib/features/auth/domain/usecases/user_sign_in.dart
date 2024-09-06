import 'package:equatable/equatable.dart';
import 'package:mourinavent/core/usecase/usecase.dart';
import 'package:mourinavent/core/utils/typedef.dart';
import 'package:mourinavent/core/common/entities/user.dart';
import 'package:mourinavent/features/auth/domain/repositories/auth_repository.dart';

class UserSignIn implements Usecase<User, UserSignInParams> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);

  @override
  ResultFuture<User> call(UserSignInParams params) async {
    return await authRepository.signIn(
        email: params.email, password: params.password);
  }
}

class UserSignInParams extends Equatable{
  final String email;
  final String password;

  const UserSignInParams({required this.email, required this.password});
  
  @override
  List<Object?> get props => [email, password];
}
