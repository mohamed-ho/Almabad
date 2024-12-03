import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/land_mark_widget.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandMarksWidget extends StatelessWidget {
  const LandMarksWidget({super.key, required this.temple});
  final Temple temple;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).landMark,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          LandMarkWidget(temple: temple)
        ],
      ),
    );
  }
}
