import 'package:rinavent/core/usecase/usecase.dart';
import 'package:rinavent/core/utils/typedef.dart';
import 'package:rinavent/features/auth/domain/repositories/auth_repository.dart';

class CurrentUser implements UsecaseWithoutParams {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);
  @override
  ResultFuture call() async {
        return await authRepository.currentUser();

  }
}