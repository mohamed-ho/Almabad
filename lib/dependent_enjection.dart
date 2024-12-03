import 'package:almabad/features/auth/auth_dependent_enjection.dart';
import 'package:almabad/features/favorite/favorite_dependent_enjection.dart';
import 'package:almabad/features/home/home_dependent_enjection.dart';
import 'package:almabad/features/local/local_dependent_enjectiaon.dart';
import 'package:get_it/get_it.dart';

final ls = GetIt.instance;

class DependentEnjection {
  init() async {
    AuthDependentInjection().init();
    HomeDependentEnjection().init();
    await LocalDependentEnjectiaon().init();
    FavoriteDependentEnjection().init();
  }
}
