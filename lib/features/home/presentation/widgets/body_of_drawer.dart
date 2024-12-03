import 'package:almabad/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:almabad/features/home/presentation/widgets/delete_account_alert_dialog.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyOfDrawer extends StatelessWidget {
  const BodyOfDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            S.of(context).logout,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          leading: Text(
            '𓅓𓂝',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          onTap: () {
            BlocProvider.of<AuthCubit>(context).logoutAccount();
          },
        ),
        ListTile(
          title: Text(
            S.of(context).deleteAccount,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          leading: Text(
            '𓏭𓏛',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (dialogContext) => BlocProvider.value(
                value: BlocProvider.of<AuthCubit>(context),
                child: const DeleteAccountAlertDialog(),
              ),
            );
          },
        ),
      ],
    );
  }
}
