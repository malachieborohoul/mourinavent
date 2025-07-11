import 'package:rinavent/core/domain/entities/user.dart';
import 'package:rinavent/core/usecase/usecase.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithGoogle implements UsecaseWithoutParams {
  final AuthRepository repository;

  SignUpWithGoogle(this.repository);
  @override
  ResultFuture<User> call()async {
     return await repository.signUpWithGoogle();
  }
}