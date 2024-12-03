import 'package:almabad/dependent_enjection.dart';
import 'package:almabad/features/local/data/datasources/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDependentEnjectiaon {
  init() async {
    ls.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(sharedPreferences: ls()));
    SharedPreferences pref = await SharedPreferences.getInstance();
    ls.registerLazySingleton(() => pref);
  }
}
