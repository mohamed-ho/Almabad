import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/features/home/presentation/cubit/audio_provider/audio_provider.dart';
import 'package:almabad/features/home/presentation/widgets/language_list_tile_widget.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('Setting'),
        centerTitle: true,
        backgroundColor: AppColor.bardyColor,
      ),
      body: Column(
        children: [
          SwitchListTile(
              title: Text(
                S.of(context).music,
                style: TextStyle(fontSize: 16.sp),
              ),
              subtitle: Text(S.of(context).musicThatPlayInBackground),
              value: context.watch<AudioProvider>().isplay,
              onChanged: (value) async {
                if (value) {
                  context.read<AudioProvider>().playMusic();
                } else {
                  context.read<AudioProvider>().pauseMusic();
                }
              }),
          const LanguageListTileWidget()
        ],
      ),
    );
  }
}
