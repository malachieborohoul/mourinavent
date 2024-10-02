import 'package:equatable/equatable.dart';
import 'package:rinavent/core/usecase/usecase.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/auth/domain/repositories/auth_repository.dart';

class UserForgotPassword implements Usecase<void, UserForgotPasswordParams> {
  final AuthRepository authRepository;

  UserForgotPassword(this.authRepository);

  @override
  ResultFuture<void> call(UserForgotPasswordParams params) async {
    return await authRepository.forgotPassword(
        email: params.email, );
  }
}

class UserForgotPasswordParams extends Equatable {
  final String email;

  const UserForgotPasswordParams({required this.email, });

  @override
  List<Object?> get props => [email, ];
}
