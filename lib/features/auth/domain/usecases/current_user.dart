import 'package:mourinavent/core/usecase/usecase.dart';
import 'package:mourinavent/core/utils/typedef.dart';
import 'package:mourinavent/features/auth/domain/repositories/auth_repository.dart';

class CurrentUser implements UsecaseWithoutParams {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);
  @override
  ResultFuture call() async {
        return await authRepository.currentUser();

  }
}