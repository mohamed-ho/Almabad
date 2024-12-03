import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/custom_drawer.dart';
import 'package:almabad/features/home/presentation/widgets/custom_search_icon_buttom.dart';
import 'package:almabad/features/home/presentation/widgets/temple_widget.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';

class TemplePageView extends StatelessWidget {
  TemplePageView({super.key, required this.temples});
  final List<Temple> temples;
  final PageController pageController = PageController(viewportFraction: .8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu)),
        title: Text(S.of(context).temples),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [CustomSearchIconButtom(temples: temples)],
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
