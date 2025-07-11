import 'package:fpdart/fpdart.dart';
import 'package:rinavent/core/error/failures.dart';


typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultNF<T> = Either<Failure, T>;
