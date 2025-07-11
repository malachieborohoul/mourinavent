  import 'package:fpdart/fpdart.dart';
import 'package:rinavent/core/error/exceptions.dart';
import 'package:rinavent/core/error/failures.dart';
import 'package:rinavent/core/network/connection_checker.dart';
import 'package:rinavent/core/secrets/app_secrets.dart';
import 'package:rinavent/core/utils/typedef.dart';

ResultFuture<T> errorRepoHandler<T> (Future<T> Function() fn,
  ConnectionChecker connectionChecker,)async{
try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure('Pas de connexion internet', "",AppSecrets.ERROR_NETWORK));
      }
      final res = await fn();

      return right(res);
    }
    // on AuthException catch (e) {
    //   return left(Failure(e.message));
    // }

    on ServerException catch (e) {
      return left(Failure(e.message, e.errorCode, e.error));
    }
  }
  