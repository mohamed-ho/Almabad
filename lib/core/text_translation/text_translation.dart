// ignore_for_file: depend_on_referenced_packages

import 'package:translator/translator.dart';
import 'package:intl/intl.dart';

class TextTranslation {
  GoogleTranslator translator = GoogleTranslator();

  Future<String> translation({required String input}) async {
    final result =
        await translator.translate(input, to: Intl.getCurrentLocale());
    return result.text;
  }
}
