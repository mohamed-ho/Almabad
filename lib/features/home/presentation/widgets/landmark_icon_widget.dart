import 'package:almabad/core/hero_handler/hero_handler.dart';
import 'package:almabad/features/home/domain/entities/land_mark.dart';
import 'package:almabad/features/home/presentation/widgets/cached_place_holder.dart';
import 'package:almabad/features/home/presentation/widgets/error_cached_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandMarkIconWidget extends StatelessWidget {
  const LandMarkIconWidget({super.key, required this.landmarks});
  final List<LandMark> landmarks;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: landmarks
            .sublist(0, landmarks.length > 4 ? 4 : landmarks.length)
            .map((landmark) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Hero(
          tag: HeroTagsHandler.templeLandmarkTag(landmark),
          child: Material(
            type: MaterialType.transparency,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  height: 40.w,
                  width: 40.w,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: landmark.iamge,
                    errorWidget: (context, url, error) =>
                        const ErrorCachedImage(),
                    placeholder: (context, url) => const CachedPlaceHolder(),
                  )),
            ),
          ),
        ),
      );
    }).toList());
  }
}
