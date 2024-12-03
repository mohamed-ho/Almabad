import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/core/widgets/text_translate.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WrongWidget extends StatelessWidget {
  const WrongWidget(
      {super.key, required this.message, required this.onPressed});
  final String message;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/wrong_image.png',
          width: .4.sw,
          height: .4.sw,
        ),
        TranslateText(
          text: message,
          textStyle: TextStyle(fontSize: 18.sp, color: Colors.white),
          loading: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.tootGold,
              foregroundColor: Colors.white),
          child: Text(S.of(context).OK),
        )
      ],
    );
  }
}
