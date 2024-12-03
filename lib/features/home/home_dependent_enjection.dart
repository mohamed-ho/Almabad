import 'package:almabad/core/network/network_info.dart';
import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/home/data/datasources/temple_remote_data_source.dart';
import 'package:almabad/features/home/data/repositories/temple_repository_impl.dart';
import 'package:almabad/features/home/domain/repositories/temple_reppository.dart';
import 'package:almabad/features/home/domain/usecases/get_temples_usecase.dart';
import 'package:almabad/features/home/presentation/cubit/cubit/temple_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeDependentEnjection {
  init() {
    ls.registerFactory(() => TempleCubit(getTemplesUsecase: ls()));

    ls.registerLazySingleton(() => GetTemplesUsecase(templeReppository: ls()));

    ls.registerLazySingleton<TempleReppository>(() =>
        TempleRepositoryImpl(templeRemoteDataSource: ls(), networkInfo: ls()));

    ls.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(internetConnectionChecker: ls()));

    ls.registerLazySingleton<TempleRemoteDataSource>(
        () => TempleRemoteDataSourceImpl(firebaseFirestore: ls()));

    ls.registerLazySingleton(() => InternetConnectionChecker());
  }
}
