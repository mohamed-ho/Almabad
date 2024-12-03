import 'package:almabad/core/hero_handler/hero_handler.dart';
import 'package:almabad/core/widgets/text_translate.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/landmark_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandedTempleWidget extends StatelessWidget {
  const ExpandedTempleWidget({super.key, required this.temple});
  final Temple temple;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Hero(
                    tag: HeroTagsHandler.templeNameTag(temple),
                    child: Material(
                      type: MaterialType.transparency,
                      child: TranslateText(
                        text: temple.name,
                        textStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Hero(
                      tag: HeroTagsHandler.templeLikes(temple),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30.w,
                        ),
                      ),
                    ),
                    Text(temple.numberOfLikes.toString())
                  ],
                ),
              ],
            ),
            LandMarkIconWidget(landmarks: temple.landmarks)
          ],
        ),
      ),
    );
  }
}
