import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/home/presentation/cubit/language_provider/language_provider.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LanguageListTileWidget extends StatefulWidget {
  const LanguageListTileWidget({
    super.key,
  });

  @override
  State<LanguageListTileWidget> createState() => _LanguageListTileWidgetState();
}

class _LanguageListTileWidgetState extends State<LanguageListTileWidget> {
  Offset? _tapPosition;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _tapPosition = details.globalPosition;
      },
      onTap: () {
        showMenu(
            color: AppColor.darkbardyColor,
            context: context,
            position: RelativeRect.fromLTRB(
              _tapPosition!.dx,
              _tapPosition!.dy,
              MediaQuery.of(context).size.width - _tapPosition!.dx,
              MediaQuery.of(context).size.height - _tapPosition!.dy,
            ),
            items: [
              PopupMenuItem(
                  child: const Text('English'),
                  onTap: () async {
                    await context
                        .read<LanguageProvider>()
                        .changeLanguage(lang: 'en');
                    await ls<LocalDataSource>().saveLanguage('en');
                  }),
              PopupMenuItem(
                  child: const Text('عربى'),
                  onTap: () async {
                    await context
                        .read<LanguageProvider>()
                        .changeLanguage(lang: 'ar');
                    await ls<LocalDataSource>().saveLanguage('ar');
                  })
            ]);
      },
      child: ListTile(
        title: Text(
          S.of(context).language,
          style: TextStyle(fontSize: 16.sp),
        ),
        subtitle: Text(S.of(context).theApplicationLanguage),
        trailing: Text(
          context.watch<LanguageProvider>().language,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
