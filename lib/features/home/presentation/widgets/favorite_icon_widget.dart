import 'package:almabad/core/hero_handler/hero_handler.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/error_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconjWidget extends StatelessWidget {
  const FavoriteIconjWidget({
    super.key,
    required this.temple,
  });

  final Temple temple;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<FavoriteCubit>()..isFavorite(templeId: temple.id),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteErrorState) {
            return const ErrorCachedImage();
          } else if (state is IsFavoriteState) {
            return Hero(
              tag: HeroTagsHandler.templeLikes(temple),
              child: IconButton(
                  onPressed: () {
                    state.isFavorite
                        ? BlocProvider.of<FavoriteCubit>(context)
                            .removeFromFavorite(templeId: temple.id)
                        : BlocProvider.of<FavoriteCubit>(context)
                            .addToFavorite(templeId: temple.id);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: state.isFavorite ? Colors.red : Colors.white,
                    size: 30.2,
                  )),
            );
          } else if (state is FavoriteLoadedState) {
            BlocProvider.of<FavoriteCubit>(context)
                .isFavorite(templeId: temple.id);
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
