import 'package:almabad/core/Failure/exception_handler.dart';
import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/core/constant/login_type.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/auth/data/datasources/auth_remote_data_souce.dart';
import 'package:almabad/features/auth/data/models/user_model.dart';
import 'package:almabad/features/auth/domain/entities/user.dart';
import 'package:almabad/features/auth/domain/repositories/auth_repository.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSouce authRemoteDataSouce;
  AuthRepositoryImpl({required this.authRemoteDataSouce});
  @override
  Future<Either<Failure, void>> deleteAccount(String userid) async {
    try {
      final result = await authRemoteDataSouce.deleteAccount(userid);
      await ls<LocalDataSource>().removeLocalData();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(User user) async {
    try {
      final result = await authRemoteDataSouce.signUp(UserModel.fromUser(user));
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }

  @override
  Future<Either<Failure, User>> login(
      {User? user, required LoginType loginType}) async {
    try {
      switch (loginType) {
        case LoginType.emailAndPassword:
          {
            print('we are here  ${user!.email} ${user.password}');
            return Right(
                await authRemoteDataSouce.login(UserModel.fromUser(user)));
          }
        case LoginType.google:
          return Right(await authRemoteDataSouce.signInWithGoogle());
        case LoginType.facebook:
          return Right(await authRemoteDataSouce.signInWithFacebook());
      }
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authRemoteDataSouce.logout();
      await ls<LocalDataSource>().removeLocalData();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }
}
