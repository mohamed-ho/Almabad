import 'package:almabad/core/hero_handler/hero_handler.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/favorite_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageDetailsWidget extends StatelessWidget {
  const ImageDetailsWidget({
    super.key,
    required this.temple,
  });

  final Temple temple;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .5.sh,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
              tag: HeroTagsHandler.mainTempleImageTag(temple),
              child: Material(
                type: MaterialType.transparency,
                child: Image.network(
                  temple.imagePath,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: .5.sh,
                ),
              )),
          Positioned(
            left: 10.w,
            top: 10.w,
            child: FavoriteIconjWidget(temple: temple),
          ),
        ],
      ),
    );
  }
}
