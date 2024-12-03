import 'package:almabad/core/Failure/exception_handler.dart';
import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/core/network/network_info.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:almabad/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:dartz/dartz.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;
  final NetworkInfo networkInfo;
  FavoriteRepositoryImpl(
      {required this.favoriteRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, void>> addToFavorite(String templeId) async {
    try {
      final result = await favoriteRemoteDataSource.addToFavorite(templeId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }

  @override
  Future<Either<Failure, List<Temple>>> getFavoriteTemples() async {
    try {
      if (await networkInfo.isConnection) {
        final result = await favoriteRemoteDataSource.getFavoriteTemples();
        await ls<LocalDataSource>().addCachedFavoriteTemples(result);
        return Right(result);
      } else {
        final result = ls<LocalDataSource>().getCachedFavoriteTemples();
        return Right(result);
      }
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(String templeId) async {
    try {
      final result = await favoriteRemoteDataSource.isFavorite(templeId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavorite(String templeId) async {
    try {
      final result =
          await favoriteRemoteDataSource.removeFromFavorite(templeId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(FirebaseExceptionHandler.handleException(e)));
    }
  }
}
