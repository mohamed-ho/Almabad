import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});
  Future<Either<Failure, void>> call() async {
    return await authRepository.logout();
  }
}
