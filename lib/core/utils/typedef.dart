import 'package:fpdart/fpdart.dart';
import 'package:mourinavent/core/error/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
