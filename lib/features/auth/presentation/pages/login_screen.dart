import 'package:almabad/config/routes/app_routes.dart';
import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/core/constant/login_type.dart';
import 'package:almabad/core/functions/error__dialog.dart';
import 'package:almabad/core/functions/loading_dialog.dart';
import 'package:almabad/core/functions/validation.dart';
import 'package:almabad/core/widgets/custom_elevated_button.dart';
import 'package:almabad/core/widgets/custom_text_form_field.dart';
import 'package:almabad/features/auth/domain/entities/user.dart';
import 'package:almabad/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:almabad/features/auth/presentation/widgets/login_rich_text.dart';
import 'package:almabad/features/auth/presentation/widgets/sign_in_with_google_or_facebook.dart';
import 'package:almabad/features/auth/presentation/widgets/verify_email_widget.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          _listen(context, state);
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Image.asset('assets/images/toot.png'),
                SizedBox(
                  height: 16.w,
                ),
                CustomTextFormField(
                  validator: (value) =>
                      Validation.validateEmail(value, context),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: AppColor.tootBlue,
                  ),
                  controller: emailController,
                  hintText: S.of(context).enterEmail,
                ),
                SizedBox(
                  height: 16.w,
                ),
                CustomTextFormField(
                  validator: (value) =>
                      Validation.validatePassword(value, context),
                  controller: passwordController,
                  hintText: S.of(context).enterPassword,
                  prefixIcon: const Icon(
                    Icons.password,
                    color: AppColor.tootBlue,
                  ),
                  obscureText: hidePassword,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: hidePassword
                          ? const Icon(
                              Icons.visibility,
                              color: AppColor.tootBlue,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: AppColor.tootBlue,
                            )),
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().login(
                          user: User(
                              password: passwordController.text,
                              email: emailController.text),
                          loginType: LoginType.emailAndPassword);
                    }
                  },
                  buttonText: S.of(context).login,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const SignInWithGoogleOrFaceBookWidget(),
                SizedBox(
                  height: 16.h,
                ),
                LoginRichText(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.signUpScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

_listen(BuildContext context, AuthState state) {
  if (state is AuthLoadingState) {
    loadingDialog(context);
  } else if (state is AuthErrorState) {
    Navigator.pop(context);
    errorDialog(context, state.message);
  } else if (state is AuthloginState) {
    Navigator.pop(context);
    if (state.user.verified) {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.homeScreen, (route) => false);
    } else {
      showDialog(
          context: context, builder: (context) => const VerifyEmailWidget());
    }
  }
}
