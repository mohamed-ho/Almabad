import 'package:almabad/features/favorite/domain/usecases/add_to_favorite_usecase.dart';
import 'package:almabad/features/favorite/domain/usecases/get_favortie_temples._usecase.dart';
import 'package:almabad/features/favorite/domain/usecases/is_favorite_usecase.dart';
import 'package:almabad/features/favorite/domain/usecases/remove_from_favorite_usecase.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final AddToFavoriteUsecase addToFavoriteUsecase;
  final GetFavoriteTemplesUsecase getFavoriteTemplesUsecase;
  final IsFavoriteUsecase isFavoriteUsecase;
  final RemoveFromFavoriteUsecase removeFromFavoriteUsecase;
  FavoriteCubit(
      {required this.addToFavoriteUsecase,
      required this.getFavoriteTemplesUsecase,
      required this.isFavoriteUsecase,
      required this.removeFromFavoriteUsecase})
      : super(FavoriteInitial());

  Future<void> addToFavorite({required String templeId}) async {
    emit(FavoriteLoadingState());
    final result = await addToFavoriteUsecase(templeId: templeId);
    result.fold((l) => emit(FavoriteErrorState(message: l.message)),
        (r) => emit(FavoriteLoadedState()));
  }

  Future<void> getFavoriteTemples() async {
    emit(FavoriteLoadingState());
    final result = await getFavoriteTemplesUsecase();
    result.fold((l) => emit(FavoriteErrorState(message: l.message)),
        (r) => emit(FavoriteGetTemplesState(temples: r)));
  }

  Future<void> isFavorite({required String templeId}) async {
    emit(FavoriteLoadingState());
    final result = await isFavoriteUsecase(templeId: templeId);
    result.fold((l) => emit(FavoriteErrorState(message: l.message)), (r) {
      emit(IsFavoriteState(isFavorite: r));
    });
  }

  Future<void> removeFromFavorite({required String templeId}) async {
    emit(FavoriteLoadingState());
    final result = await removeFromFavoriteUsecase(templeId: templeId);
    result.fold((l) => emit(FavoriteErrorState(message: l.message)),
        (r) => emit(FavoriteLoadedState()));
  }
}
