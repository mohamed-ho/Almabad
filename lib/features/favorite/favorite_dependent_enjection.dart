import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:almabad/features/favorite/data/repositories/favorite_repository_impl.dart';
import 'package:almabad/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:almabad/features/favorite/domain/usecases/add_to_favorite_usecase.dart';
import 'package:almabad/features/favorite/domain/usecases/get_favortie_temples._usecase.dart';
import 'package:almabad/features/favorite/domain/usecases/is_favorite_usecase.dart';
import 'package:almabad/features/favorite/domain/usecases/remove_from_favorite_usecase.dart';
import 'package:almabad/features/favorite/presentation/cubit/favorite_cubit.dart';

class FavoriteDependentEnjection {
  init() {
    ls.registerFactory(() => FavoriteCubit(
        addToFavoriteUsecase: ls(),
        getFavoriteTemplesUsecase: ls(),
        isFavoriteUsecase: ls(),
        removeFromFavoriteUsecase: ls()));
    ls.registerLazySingleton(
        () => AddToFavoriteUsecase(favoriteRepository: ls()));
    ls.registerLazySingleton(
        () => GetFavoriteTemplesUsecase(favoriteRepository: ls()));
    ls.registerLazySingleton(() => IsFavoriteUsecase(favoriteRepository: ls()));
    ls.registerLazySingleton(
        () => RemoveFromFavoriteUsecase(favoriteRepository: ls()));

    ls.registerLazySingleton<FavoriteRepository>(() => FavoriteRepositoryImpl(
        favoriteRemoteDataSource: ls(), networkInfo: ls()));

    ls.registerLazySingleton<FavoriteRemoteDataSource>(
        () => FavoriteRemoteDataSourceImpl(firebaseFirestore: ls()));
  }
}
