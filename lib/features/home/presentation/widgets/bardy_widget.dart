import 'package:almabad/core/hero_handler/hero_handler.dart';
import 'package:almabad/core/widgets/text_translate.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BardyWidget extends StatelessWidget {
  const BardyWidget({
    super.key,
    required this.temple,
  });

  final Temple temple;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bardy1.png',
          fit: BoxFit.fill,
          height: 120,
          width: double.infinity,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Hero(
                tag: HeroTagsHandler.templeNameTag(temple),
                child: Material(
                  type: MaterialType.transparency,
                  child: TranslateText(
                    text: temple.name,
                    textStyle:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TranslateText(
                  text: ' ${S.of(context).location} : ${temple.location}'),
              TranslateText(
                  text:
                      'Open At ${temple.openTime} , Close At ${temple.closeTime}'),
            ],
          ),
        ),
      ],
    );
  }
}
