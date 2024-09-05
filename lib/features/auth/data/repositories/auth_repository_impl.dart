import 'package:fpdart/fpdart.dart';
import 'package:mourinavent/core/error/exceptions.dart';
import 'package:mourinavent/core/error/failures.dart';
import 'package:mourinavent/core/utils/typedef.dart';
import 'package:mourinavent/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mourinavent/features/auth/data/models/user_model.dart';
import 'package:mourinavent/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  ResultFuture<UserModel> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
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
}
