import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/widgets/custom_search_delegate.dart';
import 'package:flutter/material.dart';

class CustomSearchIconButtom extends StatelessWidget {
  const CustomSearchIconButtom({super.key, required this.temples});
  final List<Temple> temples;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () async {
          await showSearch(
              context: context, delegate: CustomSearchDelegate(temples));
        },
        child: const Icon(
          Icons.search,
          size: 30,
        ),
      ),
    );
  }
}
