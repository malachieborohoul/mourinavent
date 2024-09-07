import 'package:fpdart/fpdart.dart';
import 'package:mourinavent/core/common/entities/user.dart';
import 'package:mourinavent/core/error/exceptions.dart';
import 'package:mourinavent/core/error/failures.dart';
import 'package:mourinavent/core/utils/typedef.dart';
import 'package:mourinavent/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mourinavent/features/auth/data/models/user_model.dart';
import 'package:mourinavent/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final GoogleSignIn googleSignIn;

  AuthRepositoryImpl(this.authRemoteDataSource, this.googleSignIn);
  @override
  ResultFuture<UserModel> signIn(
      {required String email, required String password}) async {
    return _getUser(() async =>
        await authRemoteDataSource.signIn(email: email, password: password));
  }

  @override
  ResultFuture<UserModel> signUp(
      {required String name, required String email, required String password}) {
    return _getUser(() async => await authRemoteDataSource.signUp(
        name: name, email: email, password: password));
  }

  ResultFuture<UserModel> _getUser(Future<UserModel> Function() fn) async {
    try {
      final user = await fn();

      return right(user);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  ResultFuture<UserModel> currentUser() async {
    try {
      final user = await authRemoteDataSource.getCurrentUserData();

      if (user == null) {
        return left(Failure("User not logged in!"));
      }

      return right(user);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  // @override
  // ResultFuture<UserModel> signInWithGoogle() {
  //   // TODO: implement signInWithGoogle
  //   throw UnimplementedError();
  // }

  @override
  ResultFuture<UserModel> signUpWithGoogle() async {
    try {
      final account = await googleSignIn.signIn();

      if (account == null) {
        return left(Failure("Failed to sign up with Google"));
      }
      final user = UserModel(
          id: account.id, email: account.email, name: account.displayName!);

      return right(user);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
