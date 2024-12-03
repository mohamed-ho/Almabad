import 'dart:convert';

import 'package:almabad/core/constant/shared_preferences_constant.dart';
import 'package:almabad/features/auth/data/models/user_model.dart';
import 'package:almabad/features/auth/domain/entities/user.dart';
import 'package:almabad/features/home/data/models/temple_model.dart';
import 'package:almabad/features/home/domain/entities/temple.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  bool isLogin();
  String userLanguage();
  User getUserData();
  Future<void> saveLogin();
  Future<void> saveLanguage(String language);
  Future<void> addUserData(User user);
  List<Temple> getCachedTemples();
  Future<void> addCachedTemples(List<Temple> temples);
  List<Temple> getCachedFavoriteTemples();
  Future<void> addCachedFavoriteTemples(List<Temple> temples);
  Future<void> removeUserData();
  Future<void> removeLogin();
  Future<void> removeLocalData();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> addCachedFavoriteTemples(List<Temple> temples) async {
    await sharedPreferences.setStringList(
        SharedPreferencesConstant.favoriteTemplestKey,
        List<String>.from(temples.map(
            (temple) => jsonEncode(TempleModel.fromTemple(temple).toJson()))));
  }

  @override
  Future<void> addCachedTemples(List<Temple> temples) async {
    await sharedPreferences.setStringList(
        SharedPreferencesConstant.templesKey,
        List<String>.from(temples.map(
            (temple) => jsonEncode(TempleModel.fromTemple(temple).toJson()))));
  }

  @override
  Future<void> addUserData(User user) async {
    try {
      await sharedPreferences.setString(SharedPreferencesConstant.userDataKey,
          jsonEncode(UserModel.fromUser(user).toLocal()));
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<Temple> getCachedFavoriteTemples() {
    final result = sharedPreferences
        .getStringList(SharedPreferencesConstant.favoriteTemplestKey);
    if (result == null) return [];
    return List<Temple>.from(
        result.map((temple) => TempleModel.fromJson(jsonDecode(temple))));
  }

  @override
  List<Temple> getCachedTemples() {
    final result =
        sharedPreferences.getStringList(SharedPreferencesConstant.templesKey);
    if (result == null) return [];
    return List<Temple>.from(
        result.map((temple) => TempleModel.fromJson(jsonDecode(temple))));
  }

  @override
  User getUserData() {
    try {
      final result = sharedPreferences.getString(
        SharedPreferencesConstant.userDataKey,
      );

      return UserModel.fromLocal(result!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool isLogin() {
    return sharedPreferences.getBool(SharedPreferencesConstant.isLoginKey) ??
        false;
  }

  @override
  Future<void> saveLanguage(String language) async {
    await sharedPreferences.setString(
        SharedPreferencesConstant.userLanguageKey, language);
  }

  @override
  Future<void> saveLogin() async {
    await sharedPreferences.setBool(SharedPreferencesConstant.isLoginKey, true);
  }

  @override
  String userLanguage() {
    return sharedPreferences
            .getString(SharedPreferencesConstant.userLanguageKey) ??
        "en";
  }

  @override
  Future<void> removeUserData() async {
    try {
      await sharedPreferences.remove(SharedPreferencesConstant.userDataKey);
      await removeLogin();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeLogin() async {
    try {
      await sharedPreferences.remove(SharedPreferencesConstant.isLoginKey);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeLocalData() async {
    await sharedPreferences.clear();
  }
}
