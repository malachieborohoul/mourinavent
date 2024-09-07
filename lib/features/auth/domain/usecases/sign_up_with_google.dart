import 'package:mourinavent/core/common/entities/user.dart';
import 'package:mourinavent/core/usecase/usecase.dart';
import 'package:mourinavent/core/utils/typedef.dart';
import 'package:mourinavent/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithGoogle implements UsecaseWithoutParams {
  final AuthRepository repository;

  SignUpWithGoogle(this.repository);
  @override
  ResultFuture<User> call()async {
     return await repository.signUpWithGoogle();
  }
}