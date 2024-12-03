import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/core/constant/login_type.dart';
import 'package:almabad/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInWithGoogleOrFaceBookWidget extends StatelessWidget {
  const SignInWithGoogleOrFaceBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              child: Divider(),
            ),
            Text(
              S.of(context).loginWithanotherWay,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColor.tootBlue,
                  fontWeight: FontWeight.bold),
            ),
            const Expanded(child: Divider())
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                context.read<AuthCubit>().login(loginType: LoginType.google);
              },
              child: Image.asset(
                'assets/icon/google.png',
                width: 50.w,
                height: 50.w,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
              onTap: () async {
                context.read<AuthCubit>().login(loginType: LoginType.facebook);
              },
              child: Image.asset(
                'assets/icon/facebook.png',
                width: 50.w,
                height: 50.w,
              ),
            )
          ],
        ),
      ],
    );
  }
}
