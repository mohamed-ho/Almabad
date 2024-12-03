import 'package:almabad/core/functions/validation.dart';
import 'package:almabad/core/widgets/custom_elevated_button.dart';
import 'package:almabad/features/auth/domain/entities/user.dart';
import 'package:almabad/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:almabad/features/auth/presentation/widgets/sign_up_rick_text.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:almabad/core/constant/app_color.dart';
import 'package:almabad/core/widgets/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SginUpScreen extends StatefulWidget {
  const SginUpScreen({super.key});

  @override
  State<SginUpScreen> createState() => _SginUpScreenState();
}

class _SginUpScreenState extends State<SginUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoadingState) {
                showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ));
              } else if (state is AuthErrorState) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('error'),
                          content: Text(state.message),
                          actions: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white),
                              child: const Text('OK'),
                            )
                          ],
                        ));
              } else if (state is AuthLoadedState) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Success process')));
              }
            },
            child: Column(
              children: [
                Image.asset('assets/images/toot.png'),
                SizedBox(
                  height: 16.w,
                ),
                CustomTextFormField(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColor.tootBlue,
                  ),
                  controller: nameController,
                  hintText: S.of(context).enterFullName,
                ),
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
                      context.read<AuthCubit>().signup(User(
                          id: 'id',
                          name: nameController.text,
                          password: passwordController.text,
                          email: emailController.text));
                    }
                  },
                  buttonText: S.of(context).signUp,
                ),
                SizedBox(
                  height: 16.h,
                ),
                SignUpRickText(
                  onTap: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
