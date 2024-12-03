import 'package:almabad/al_mabad.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/home/presentation/cubit/audio_provider/audio_provider.dart';
import 'package:almabad/features/home/presentation/cubit/language_provider/language_provider.dart';
import 'package:almabad/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DependentEnjection().init();
  //await ls<LocalDataSource>().removeUserData();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AudioProvider()),
    ChangeNotifierProvider(create: (_) => LanguageProvider())
  ], child: const AlMabad()));
}
