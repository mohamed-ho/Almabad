import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:almabad/features/home/presentation/pages/temple_details_screen.dart';
import 'package:almabad/features/home/presentation/widgets/expanded_temple_widget.dart';
import 'package:almabad/features/home/presentation/widgets/un_expanded_temple_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TempleWidget extends StatefulWidget {
  const TempleWidget({super.key, required this.temple});
  final Temple temple;
  @override
  State<TempleWidget> createState() => _TempleWidgetState();
}

class _TempleWidgetState extends State<TempleWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          width: isExpanded ? .8.sw : .65.sw,
          height: isExpanded ? .50.sh : .4.sh,
          bottom: isExpanded ? 100.h : 150.h,
          child: ExpandedTempleWidget(temple: widget.temple),
        ),
        AnimatedPositioned(
          bottom: isExpanded ? 200.h : 150.h,
          duration: const Duration(milliseconds: 500),
          child: GestureDetector(
            onTap: ontap,
            onPanUpdate: (details) {
              if (details.delta.dy < 0) {
                setState(() {
                  isExpanded = true;
                });
              } else if (details.delta.dy > 0) {
                setState(() {
                  isExpanded = false;
                });
              }
            },
            child: UnExpandedTempleWidget(temple: widget.temple),
          ),
        )
        // AnimatedPositioned(child: child, duration: duration)
      ],
    );
  }

  ontap() {
    if (!isExpanded) {
      setState(() {
        isExpanded = true;
        return;
      });
    } else {
      Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: const Interval(0, .5));
          return FadeTransition(
            opacity: curvedAnimation,
            child: TempleDetailsScreen(
              animation: animation,
              temple: widget.temple,
            ),
          );
        },
      ));
    }
  }
}
