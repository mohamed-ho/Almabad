import 'package:almabad/core/hero_handler/hero_handler.dart';
import 'package:almabad/core/widgets/text_translate.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/bardy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionDetailsWidget extends StatelessWidget {
  const DescriptionDetailsWidget({
    super.key,
    required this.temple,
  });
  final Temple temple;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: Column(
        children: [
          BardyWidget(temple: temple),
          Hero(
              tag: HeroTagsHandler.templeDescription(temple),
              child: Material(
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: TranslateText(
                      textAlign: TextAlign.center,
                      text: temple.description,
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ))),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}
