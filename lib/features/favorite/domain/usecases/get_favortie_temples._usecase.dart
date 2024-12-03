import 'package:almabad/core/Failure/failure.dart';
import 'package:almabad/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:dartz/dartz.dart';

class GetFavoriteTemplesUsecase {
  final FavoriteRepository favoriteRepository;

  GetFavoriteTemplesUsecase({required this.favoriteRepository});

  Future<Either<Failure, List<Temple>>> call() async {
    return await favoriteRepository.getFavoriteTemples();
  }
}
