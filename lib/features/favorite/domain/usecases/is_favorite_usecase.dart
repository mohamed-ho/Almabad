import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:dartz/dartz.dart';

class IsFavoriteUsecase {
  final FavoriteRepository favoriteRepository;

  IsFavoriteUsecase({required this.favoriteRepository});

  Future<Either<Failure, bool>> call({required String templeId}) async {
    return await favoriteRepository.isFavorite(templeId);
  }
}
