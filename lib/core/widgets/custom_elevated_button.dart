import 'package:almabad/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.onPressed, required this.buttonText});
  final void Function()? onPressed;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          backgroundColor: AppColor.tootBlue,
          foregroundColor: Colors.white),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 18.sp),
      ),
    );
  }
}
