import 'package:almabad/core/functions/hiero_translate.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerCircleAvatar extends StatelessWidget {
  const DrawerCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: translateToHieroglyph(
        ls<LocalDataSource>().getUserData().name!,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
          );
        } else if (snapshot.hasError) {
          return Text(
            '${ls<LocalDataSource>().getUserData().name![0]} ${ls<LocalDataSource>().getUserData().name![1]}',
            style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
