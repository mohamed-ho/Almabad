import 'package:almabad/core/hero_handler/hero_handler.dart';
import 'package:almabad/core/widgets/text_translate.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandMarkWidget extends StatelessWidget {
  const LandMarkWidget({super.key, required this.temple});
  final Temple temple;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: temple.landmarks
          .map((landMark) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TranslateText(
                      text: landMark.name,
                      textStyle: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    TranslateText(
                      text:
                          "it is need a private ticket : ${landMark.inTicket ? "No" : "yes"}",
                      textStyle: TextStyle(fontSize: 15.sp),
                    ),
                    Hero(
                      tag: HeroTagsHandler.templeLandmarkTag(landMark),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          height: .3.sh,
                          width: double.infinity,
                          child: Image.network(
                            landMark.iamge,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    TranslateText(
                      text: landMark.description,
                      textStyle: TextStyle(fontSize: 14.sp),
                      loading: const Center(child: CircularProgressIndicator()),
                    ),
                    const Divider()
                  ],
                ),
              ))
          .toList(),
    );
  }
}
