import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/home/presentation/widgets/drawer_circle_avater.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadOfDrawer extends StatelessWidget {
  const HeadOfDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.w,
          backgroundColor: AppColor.tootGold,
          child: const DrawerCircleAvatar(),
        ),
        Text(
          ls<LocalDataSource>().getUserData().name!,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          ls<LocalDataSource>().getUserData().email,
          style: TextStyle(fontSize: 14.sp),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}
