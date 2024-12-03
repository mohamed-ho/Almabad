import 'package:flutter/material.dart';

class CachedPlaceHolder extends StatelessWidget {
  const CachedPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()));
  }
}
