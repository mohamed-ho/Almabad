import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/auth/data/datasources/auth_remote_data_souce.dart';
import 'package:almabad/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:almabad/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:almabad/features/auth/domain/repositories/auth_repository.dart';
import 'package:almabad/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:almabad/features/auth/domain/usecases/login_usercase.dart';
import 'package:almabad/features/auth/domain/usecases/logout_usecase.dart';
import 'package:almabad/features/auth/domain/usecases/signup_usercase.dart';
import 'package:almabad/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDependentInjection {
  init() {
    // cubit
    ls.registerFactory(() => AuthCubit(
        deleteAccountUsecase: ls(),
        loginUsercase: ls(),
        signupUsercase: ls(),
        logoutUsecase: ls()));

    // usercases
    ls.registerLazySingleton(() => DeleteAccountUsecase(authRepository: ls()));
    ls.registerLazySingleton(() => LoginUsercase(authRepository: ls()));
    ls.registerLazySingleton(() => SignupUsercase(authRepository: ls()));
    ls.registerLazySingleton(() => LogoutUsecase(authRepository: ls()));

    // repositories
    ls.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(authRemoteDataSouce: ls()));

    // data
    ls.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl(firebaseFirestore: ls()));
    ls.registerLazySingleton<AuthRemoteDataSouce>(
        () => AuthRemoteDataSouceImpl(firebaseAuth: ls()));

    // auther
    ls.registerLazySingleton(() => FirebaseFirestore.instance);
    ls.registerLazySingleton(() => FirebaseAuth.instance);
  }
}
