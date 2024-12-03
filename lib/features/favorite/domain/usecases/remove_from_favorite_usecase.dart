import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveFromFavoriteUsecase {
  final FavoriteRepository favoriteRepository;

  RemoveFromFavoriteUsecase({required this.favoriteRepository});

  Future<Either<Failure, void>> call({required String templeId}) async {
    return await favoriteRepository.removeFromFavorite(templeId);
  }
}
