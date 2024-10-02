import 'package:equatable/equatable.dart';
import 'package:rinavent/core/common/entities/user.dart';
import 'package:rinavent/core/usecase/usecase.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/auth/domain/repositories/auth_repository.dart';

class UserForgotPasswordWithToken implements Usecase<User, UserForgotPasswordWithTokenParams> {
  final AuthRepository authRepository;

  UserForgotPasswordWithToken(this.authRepository);

  @override
  ResultFuture<User> call(UserForgotPasswordWithTokenParams params) async {
    return await authRepository.forgotPasswordWithToken(
        email: params.email, 
        password: params.password, 
        token: params.token, 
        );
  }
}

class UserForgotPasswordWithTokenParams extends Equatable {
  final String email;
  final String password;
  final String token;

  const UserForgotPasswordWithTokenParams( {required this.email,required this.password, required this.token, });

  @override
  List<Object?> get props => [email,password, token ];
}
