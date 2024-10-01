import 'package:fpdart/fpdart.dart';
import 'package:rinavent/core/error/exceptions.dart';
import 'package:rinavent/core/error/failures.dart';
import 'package:rinavent/core/network/connection_checker.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:rinavent/features/auth/data/models/user_model.dart';
import 'package:rinavent/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final ConnectionChecker connectionChecker;


  AuthRepositoryImpl(
    this.authRemoteDataSource, this.connectionChecker,
  );
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

  @override
  ResultFuture<UserModel> signUpWithGoogle() async {
    return _getUser(() async => await authRemoteDataSource.signUpWithGoogle());
  }

   @override
  ResultFuture<UserModel> signUpWithApple() {
    return _getUser(() async => await authRemoteDataSource.signUpWithApple());
  }

  ResultFuture<UserModel> _getUser(Future<UserModel> Function() fn) async {
    try {
       if (!await (connectionChecker.isConnected)) {
        return left(Failure('No internet connection'));
      }
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
            if (!await (connectionChecker.isConnected)) {
        final session = authRemoteDataSource.currentUserSession;

        if (session == null) {
          return left(Failure("User not logged in!"));
        }

        return right(UserModel(
            id: session.user.id, email: session.user.email ?? '', name: '', updatedAt: DateTime.parse(session.user.updatedAt!), gender: '', age: 0, phoneNumber: '', countryCode: '', avatar: ''));
      }
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

  @override
  ResultFuture<void> signOut() async{
        try {
      await authRemoteDataSource.signOut();

     

      return right(null);
    } on AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

 


}
