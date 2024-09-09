import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/core/common/entities/user.dart';

abstract interface class AuthRepository {
  ResultFuture<User> signUp({
    required String name,
    required String email,
    required String password,
  });

  ResultFuture<User> signIn({
    required String email,
    required String password,
  });

  ResultFuture<User> signUpWithGoogle();
  // ResultFuture<User> signInWithGoogle();

  ResultFuture<User> signUpWithApple();



  ResultFuture<User> currentUser();
}
