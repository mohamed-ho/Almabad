import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:almabad/features/home/presentation/cubit/audio_provider/audio_provider.dart';
import 'package:almabad/features/home/presentation/cubit/cubit/temple_cubit.dart';
import 'package:almabad/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:almabad/features/home/presentation/widgets/custom_drawer.dart';
import 'package:almabad/features/home/presentation/widgets/settings_widget.dart';
import 'package:almabad/features/home/presentation/widgets/temple_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final List<Widget> taps = [
    BlocProvider(
      create: (context) => ls<TempleCubit>()..getTemples(),
      child: BlocBuilder<TempleCubit, TempleState>(
        builder: (context, state) {
          if (state is TempleGetedTemples) {
            return TemplePageView(
              temples: state.temples,
            );
          } else if (state is TempleErrorState) {
            return ErrorWidget(state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
    BlocProvider(
      create: (context) => ls<FavoriteCubit>()..getFavoriteTemples(),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteGetTemplesState) {
            if (state.temples.isEmpty) {
              return const Center(
                child: Text('there are no favoite Temple'),
              );
            } else {
              return TemplePageView(
                temples: state.temples,
              );
            }
          } else if (state is FavoriteErrorState) {
            return ErrorWidget(state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
    const SettingsWidget()
  ];
  @override
  void initState() {
    context.read<AudioProvider>().playMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
      ),
      body: taps[currentIndex],
    );
  }
}
