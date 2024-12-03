import 'package:almabad/config/routes/app_routes.dart';
import 'package:almabad/config/themes/app_theme.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/home/presentation/cubit/language_provider/language_provider.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';

import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AlMabad extends StatelessWidget {
  const AlMabad({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SafeArea(
        child: MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale(context.watch<LanguageProvider>().language),
          supportedLocales: S.delegate.supportedLocales,
          theme: AppTheme.appTheme(),
          onGenerateRoute: AppRoutes.routes,
          initialRoute: ls<LocalDataSource>().isLogin()
              ? AppRoutes.homeScreen
              : AppRoutes.loginScreen,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
