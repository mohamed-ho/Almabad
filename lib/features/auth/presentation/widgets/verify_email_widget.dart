import 'package:almabad/core/widgets/text_translate.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmailWidget extends StatelessWidget {
  const VerifyEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/verify.png',
          width: .5.sw,
          height: .5.sw,
        ),
        Align(
            alignment: Alignment.center,
            child: TranslateText(
              text: S.of(context).verifyYourEmail,
              loading: const CircularProgressIndicator(
                color: Colors.white,
              ),
              textStyle: TextStyle(
                fontSize: 18.w,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
