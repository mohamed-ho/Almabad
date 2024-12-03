import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/description_details_widget.dart';
import 'package:almabad/features/home/presentation/widgets/image_details_widget.dart';
import 'package:almabad/features/home/presentation/widgets/land_marks_widget.dart';
import 'package:almabad/features/home/presentation/widgets/price_widget.dart';
import 'package:flutter/material.dart';

class TempleDetailsScreen extends StatelessWidget {
  const TempleDetailsScreen(
      {super.key, required this.temple, required this.animation});
  final Temple temple;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageDetailsWidget(temple: temple),
            DescriptionDetailsWidget(temple: temple),
            PriceWidget(price: temple.price),
            LandMarksWidget(
              temple: temple,
            )
          ],
        ),
      ),
    );
  }
}
