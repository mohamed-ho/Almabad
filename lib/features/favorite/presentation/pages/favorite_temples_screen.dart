import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/temple_widget.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteTemplesScreen extends StatelessWidget {
  FavoriteTemplesScreen({super.key, required this.temples});
  final List<Temple> temples;
  final PageController pageController = PageController(viewportFraction: .8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).temples),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30.w,
              )),
        ],
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: temples.length,
        itemBuilder: (context, index) {
          return TempleWidget(temple: temples[index]);
        },
      ),
    );
  }
}
