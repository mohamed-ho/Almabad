import 'package:almabad/core/hero_handler/hero_handler.dart';
import 'package:almabad/core/widgets/text_translate.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/cached_place_holder.dart';
import 'package:almabad/features/home/presentation/widgets/error_cached_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnExpandedTempleWidget extends StatelessWidget {
  const UnExpandedTempleWidget({super.key, required this.temple});
  final Temple temple;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: .5.sh,
        width: .75.sw,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Hero(
                tag: HeroTagsHandler.mainTempleImageTag(temple),
                child: CachedNetworkImage(
                    imageUrl: temple.imagePath,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) =>
                        const ErrorCachedImage(),
                    placeholder: (context, url) => const CachedPlaceHolder()),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: TranslateText(
                  textAlign: TextAlign.center,
                  text: temple.location,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Open At : ${temple.openTime}',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text('Close At :${temple.closeTime}',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
