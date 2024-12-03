import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:almabad/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountAlertDialog extends StatelessWidget {
  const DeleteAccountAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).deleteAccount),
      content: Text(S.of(context).doYouWantToDeleteAccount),
      actions: [
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context)
                .deleteAccount(ls<LocalDataSource>().getUserData().id!);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, foregroundColor: Colors.white),
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, foregroundColor: Colors.white),
          child: const Text('NO'),
        )
      ],
    );
  }
}
