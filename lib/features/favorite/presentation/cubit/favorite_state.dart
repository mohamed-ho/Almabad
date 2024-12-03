part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteLoadedState extends FavoriteState {}

class IsFavoriteState extends FavoriteState {
  final bool isFavorite;

  const IsFavoriteState({required this.isFavorite});
}

class FavoriteErrorState extends FavoriteState {
  final String message;
  const FavoriteErrorState({required this.message});
}

class FavoriteGetTemplesState extends FavoriteState {
  final List<Temple> temples;

  const FavoriteGetTemplesState({required this.temples});
}
