import 'package:rinavent/core/common/entities/user.dart';
import 'package:rinavent/core/usecase/usecase.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithApple implements UsecaseWithoutParams {
  final AuthRepository repository;

  SignUpWithApple(this.repository);
  @override
  ResultFuture<User> call() async {
    return await repository.signUpWithApple();
  }
}
