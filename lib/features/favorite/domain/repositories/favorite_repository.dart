import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';

import 'package:dartz/dartz.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, bool>> isFavorite(String tempeId);
  Future<Either<Failure, void>> addToFavorite(String templeId);
  Future<Either<Failure, void>> removeFromFavorite(String templeId);
  Future<Either<Failure, List<Temple>>> getFavoriteTemples();
}
