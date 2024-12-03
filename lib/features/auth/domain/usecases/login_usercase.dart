import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/core/constant/login_type.dart';
import 'package:almabad/features/auth/domain/entities/user.dart';
import 'package:almabad/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsercase {
  final AuthRepository authRepository;
  LoginUsercase({required this.authRepository});

  Future<Either<Failure, User>> call(
      {User? user, required LoginType loginType}) async {
    return await authRepository.login(loginType: loginType);
  }
}
