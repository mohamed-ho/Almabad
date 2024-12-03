import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class LanguageProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String language = ls<LocalDataSource>().userLanguage();
  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> changeLanguage({required String lang}) async {
    language = lang;
    notifyListeners();
  }
}
