import 'package:almabad/config/routes/app_routes.dart';
import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/core/functions/error__dialog.dart';
import 'package:almabad/core/functions/loading_dialog.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:almabad/features/home/presentation/widgets/body_of_drawer.dart';
import 'package:almabad/features/home/presentation/widgets/head_of_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ls<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            loadingDialog(context);
          } else if (state is AuthErrorState) {
            errorDialog(context, state.message);
          } else if (state is AuthLoadedState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.loginScreen,
              (route) => false,
            );
          }
        },
        child: const Drawer(
          backgroundColor: AppColor.bardyColor,
          child: Column(
            children: [
              HeadOfDrawer(),
              BodyOfDrawer(),
            ],
          ),
        ),
      ),
    );
  }
}
