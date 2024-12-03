// ignore_for_file: file_names
import 'package:almabad/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColor.bardyColor,
      elevation: 0,
      selectedItemColor: AppColor.tootGold,
      selectedFontSize: 14.sp,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.temple_hindu_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Liked"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
      ],
    );
  }
}
