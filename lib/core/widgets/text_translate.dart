import 'package:almabad/core/text_translation/text_translation.dart';
import 'package:flutter/material.dart';

class TranslateText extends StatelessWidget {
  const TranslateText(
      {super.key,
      required this.text,
      this.loading,
      this.error,
      this.textStyle,
      this.maxLines,
      this.textAlign});
  final String text;
  final Widget? loading;
  final Widget? error;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TextTranslation().translation(input: text),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: textStyle,
            maxLines: maxLines,
            textAlign: textAlign,
          );
        } else if (snapshot.hasError) {
          return error ??
              Text(
                text,
                maxLines: maxLines,
                style: textStyle,
                textAlign: textAlign,
              );
        } else {
          return loading ?? const SizedBox();
        }
      },
    );
  }
}
