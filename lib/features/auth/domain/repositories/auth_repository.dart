import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/core/constant/login_type.dart';
import 'package:almabad/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(
      {User? user, required LoginType loginType});
  Future<Either<Failure, void>> signUp(User user);
  Future<Either<Failure, void>> deleteAccount(String userid);
  Future<Either<Failure, void>> logout();
}
