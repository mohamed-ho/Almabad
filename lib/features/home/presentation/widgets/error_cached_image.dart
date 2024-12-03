import 'package:flutter/material.dart';

class ErrorCachedImage extends StatelessWidget {
  const ErrorCachedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        color: Colors.white,
        child: Center(
          child: Icon(
            Icons.error_outline,
            size: constraints.maxWidth * .1,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
