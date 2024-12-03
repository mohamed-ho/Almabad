import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:almabad/features/auth/presentation/pages/login_screen.dart';
import 'package:almabad/features/auth/presentation/pages/sgin_up_screen.dart';
import 'package:almabad/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String homeScreen = 'homeScreen';
  static const String loginScreen = 'loginScreen';
  static const String signUpScreen = 'signUpScreen';

  static Route<dynamic> routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<AuthCubit>(),
                  child: const LoginScreen(),
                ));
      case signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<AuthCubit>(),
                  child: const SginUpScreen(),
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => const DefaultNoRouteScreen());
    }
  }
}

class DefaultNoRouteScreen extends StatelessWidget {
  const DefaultNoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('there are error in routing '),
      ),
    );
  }
}
