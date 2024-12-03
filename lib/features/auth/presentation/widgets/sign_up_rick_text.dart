import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/core/constant/app_font_family.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpRickText extends StatelessWidget {
  const SignUpRickText({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: S.of(context).iAlreadyHaveAccount,
          style: TextStyle(
              color: AppColor.tootBlue,
              fontSize: 18.sp,
              fontFamily: AppFontFamily.arabic)),
      TextSpan(
          text: S.of(context).login,
          style: TextStyle(
              color: AppColor.tootRed,
              fontSize: 18.sp,
              fontFamily: AppFontFamily.arabic),
          recognizer: TapGestureRecognizer()..onTap = onTap)
    ]));
  }
}
