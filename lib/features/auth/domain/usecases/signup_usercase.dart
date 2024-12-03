import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/features/auth/domain/entities/user.dart';
import 'package:almabad/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignupUsercase {
  final AuthRepository authRepository;
  SignupUsercase({required this.authRepository});

  Future<Either<Failure, void>> call({required User user}) async {
    return await authRepository.signUp(user);
  }
}
