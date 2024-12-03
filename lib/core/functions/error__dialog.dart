import 'package:almabad/core/widgets/wrong_widget.dart';
import 'package:flutter/material.dart';

Future<dynamic> errorDialog(BuildContext context, String message) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WrongWidget(
          message: message, onPressed: () => Navigator.pop(context)));
}
