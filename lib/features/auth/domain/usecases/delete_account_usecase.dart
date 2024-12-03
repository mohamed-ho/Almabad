import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteAccountUsecase {
  final AuthRepository authRepository;
  DeleteAccountUsecase({required this.authRepository});

  Future<Either<Failure, void>> call(String userId) async {
    return await authRepository.deleteAccount(userId);
  }
}
