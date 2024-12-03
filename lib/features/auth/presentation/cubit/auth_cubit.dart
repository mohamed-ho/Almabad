import 'package:almabad/core/constant/login_type.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/auth/domain/entities/user.dart';
import 'package:almabad/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:almabad/features/auth/domain/usecases/login_usercase.dart';
import 'package:almabad/features/auth/domain/usecases/logout_usecase.dart';
import 'package:almabad/features/auth/domain/usecases/signup_usercase.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsercase loginUsercase;
  final SignupUsercase signupUsercase;
  final DeleteAccountUsecase deleteAccountUsecase;
  final LogoutUsecase logoutUsecase;
  AuthCubit(
      {required this.deleteAccountUsecase,
      required this.loginUsercase,
      required this.signupUsercase,
      required this.logoutUsecase})
      : super(AuthInitial());

  Future<void> signup(User user) async {
    emit(AuthLoadingState());
    final result = await signupUsercase(user: user);
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }

  Future<void> login({User? user, required LoginType loginType}) async {
    emit(AuthLoadingState());
    final result = await loginUsercase(user: user, loginType: loginType);
    result.fold((l) => emit(AuthErrorState(message: l.message)), (r) async {
      if (r.verified) {
        await ls<LocalDataSource>().addUserData(r);
        await ls<LocalDataSource>().saveLogin();
      }
      emit(AuthloginState(user: r));
    });
  }

  Future<void> deleteAccount(String userid) async {
    emit(AuthLoadingState());
    final result = await deleteAccountUsecase(userid);
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }

  Future<void> logoutAccount() async {
    emit(AuthLoadingState());
    final result = await logoutUsecase();
    result.fold((l) => emit(AuthErrorState(message: l.message)),
        (r) => emit(AuthLoadedState()));
  }
}
