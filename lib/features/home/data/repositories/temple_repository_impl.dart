import 'package:almabad/core/Failure/exception_handler.dart';
import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/core/network/network_info.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/home/data/datasources/temple_remote_data_source.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/domain/repositories/temple_reppository.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:dartz/dartz.dart';

class TempleRepositoryImpl implements TempleReppository {
  final TempleRemoteDataSource templeRemoteDataSource;
  final NetworkInfo networkInfo;
  TempleRepositoryImpl(
      {required this.templeRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, Temple>> getTemple(String id) async {
    try {
      final result = await templeRemoteDataSource.getTemple(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }

  @override
  Future<Either<Failure, List<Temple>>> getTemples() async {
    try {
      if (await networkInfo.isConnection) {
        final result = await templeRemoteDataSource.getTemples();
        await ls<LocalDataSource>().addCachedTemples(result);
        return Right(result);
      } else {
        final result = ls<LocalDataSource>().getCachedTemples();
        return Right(result);
      }
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }
}
